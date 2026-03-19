#!/usr/bin/env python3
from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path


EXPECTED_DIRECTORY_COUNTS = {
    "engineering": 11,
    "design": 8,
    "marketing": 11,
    "product": 4,
    "project-management": 5,
    "testing": 8,
    "support": 6,
    "spatial-computing": 6,
    "specialized": 9,
}

HEADING_TO_DIRECTORY = {
    "Engineering": "engineering",
    "Design": "design",
    "Marketing": "marketing",
    "Product": "product",
    "Project Management": "project-management",
    "Testing": "testing",
    "Support": "support",
    "Spatial Computing": "spatial-computing",
    "Specialized": "specialized",
}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Validate expert ID mapping between SKILL.md and references/*.md."
    )
    parser.add_argument(
        "--skill-root",
        type=Path,
        default=Path(__file__).resolve().parent.parent,
        help="Path to the skill root directory containing SKILL.md and references/.",
    )
    return parser.parse_args()


def find_duplicates(values: list[str]) -> list[str]:
    counts: dict[str, int] = {}
    for value in values:
        counts[value] = counts.get(value, 0) + 1
    return sorted([value for value, count in counts.items() if count > 1])


def main() -> int:
    args = parse_args()
    skill_root = args.skill_root.resolve()
    skill_file = skill_root / "SKILL.md"
    references_root = skill_root / "references"

    if not skill_file.is_file():
        print(f"SKILL.md not found at: {skill_file}", file=sys.stderr)
        return 2
    if not references_root.is_dir():
        print(f"references directory not found at: {references_root}", file=sys.stderr)
        return 2

    failures: list[str] = []
    skill_content = skill_file.read_text(encoding="utf-8")

    expert_id_pattern = re.compile(r"\| `([^`]+)` \|")
    all_expert_ids = expert_id_pattern.findall(skill_content)
    expert_ids = sorted(set(all_expert_ids))

    if not all_expert_ids:
        failures.append("No Expert IDs were found in SKILL.md tables.")

    duplicate_expert_ids = find_duplicates(all_expert_ids)
    if duplicate_expert_ids:
        failures.append(
            "Duplicate Expert IDs in SKILL.md: " + ", ".join(duplicate_expert_ids)
        )

    reference_files = sorted(references_root.rglob("*.md"))
    all_reference_ids = [file.stem for file in reference_files]
    reference_ids = sorted(set(all_reference_ids))

    duplicate_reference_ids = find_duplicates(all_reference_ids)
    if duplicate_reference_ids:
        failures.append(
            "Duplicate reference basenames: " + ", ".join(duplicate_reference_ids)
        )

    missing_reference_files = sorted([item for item in expert_ids if item not in reference_ids])
    if missing_reference_files:
        failures.append(
            "Missing files for Expert IDs: " + ", ".join(missing_reference_files)
        )

    unlisted_reference_files = sorted([item for item in reference_ids if item not in expert_ids])
    if unlisted_reference_files:
        failures.append(
            "Reference files not listed in SKILL.md: " + ", ".join(unlisted_reference_files)
        )

    for directory_name, expected_count in EXPECTED_DIRECTORY_COUNTS.items():
        category_dir = references_root / directory_name
        if not category_dir.is_dir():
            failures.append(f"Missing category directory: {directory_name}")
            continue

        actual_count = len(list(category_dir.glob("*.md")))
        if actual_count != expected_count:
            failures.append(
                f"Category count mismatch for '{directory_name}': "
                f"expected {expected_count}, found {actual_count}"
            )

    heading_count_pattern = re.compile(r"^###\s+(.+?)\s+\((\d+)\)\s+\|")
    for line in skill_content.splitlines():
        match = heading_count_pattern.match(line)
        if not match:
            continue

        heading_name = match.group(1).strip()
        declared_count = int(match.group(2))
        mapped_directory = HEADING_TO_DIRECTORY.get(heading_name)
        if mapped_directory is None:
            continue

        expected_count = EXPECTED_DIRECTORY_COUNTS[mapped_directory]
        if declared_count != expected_count:
            failures.append(
                f"Heading count mismatch for '{heading_name}': "
                f"declared {declared_count}, expected {expected_count}"
            )

    print(f"Expert IDs in SKILL.md: {len(expert_ids)}")
    print(f"Reference files found: {len(reference_ids)}")
    print(f"Checked categories: {len(EXPECTED_DIRECTORY_COUNTS)}")

    if failures:
        print("")
        print("Validation failed with the following issues:")
        for issue in failures:
            print(f"- {issue}")
        return 1

    print("Validation passed. Expert mapping is consistent.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
