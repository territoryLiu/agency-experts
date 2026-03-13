# Agency Experts | 专业专家系统

[English](#english) | 中文

> **原型项目**: 本项目基于 [agency-agents](https://github.com/msitarzewski/agency-agents) 开发，感谢原作者的开源贡献。

一个智能专家系统，包含 **68 个专业角色**，跨 9 个类别。当用户任务匹配某个专家领域时，自动采用该专家的角色和方法。

## 特性

- **智能匹配** - 根据任务关键词自动识别最合适的专家
- **双语支持** - 所有专家都能理解和响应中英文
- **角色扮演** - 完全采用专家的技能、工作流程和沟通风格
- **代码示例** - 每个专家都附带最佳实践代码示例

## 快速开始

### 安装

将 `agency-experts` 文件夹复制到你的 Claude Code 项目中。

### 使用方法

只需描述你的任务，系统会自动识别并加载相关专家：

```
用户: "帮我开发一个React组件"
→ 匹配: engineering-frontend-developer
→ 加载: references/engineering/engineering-frontend-developer.md

用户: "设计一个landing page"
→ 匹配: design-ui-designer
→ 加载: references/design/design-ui-designer.md

用户: "我需要制定一个增长策略"
→ 匹配: marketing-growth-hacker
→ 加载: references/marketing/marketing-growth-hacker.md
```

## 专家分类

### Engineering 工程类 (11位专家)

| 专家 ID | 触发关键词 |
|---------|-----------|
| `engineering-frontend-developer` | React, Vue, Angular, UI实现, 响应式, 前端 |
| `engineering-backend-architect` | API设计, 数据库, 后端架构, 微服务 |
| `engineering-senior-developer` | 全栈, 高级开发, 复杂实现 |
| `engineering-ai-engineer` | AI, ML, LLM, 机器学习, 模型 |
| `engineering-mobile-app-builder` | iOS, Android, 移动端, App, Flutter |
| `engineering-devops-automator` | CI/CD, 部署, 基础设施, Docker, K8s |
| `engineering-security-engineer` | 安全, 漏洞, 审计, 加密, 渗透测试 |
| `engineering-data-engineer` | 数据管道, ETL, 数据仓库, 大数据 |
| `engineering-rapid-prototyper` | MVP, 原型, 快速验证, PoC |
| `engineering-technical-writer` | 文档, API文档, 技术写作 |
| `engineering-autonomous-optimization-architect` | 自动优化, 自适应系统 |

### Design 设计类 (8位专家)

| 专家 ID | 触发关键词 |
|---------|-----------|
| `design-ui-designer` | UI设计, 组件系统, 视觉设计, 界面 |
| `design-ux-researcher` | UX研究, 用户调研, 可用性测试 |
| `design-ux-architect` | UX架构, 信息架构, 用户流程 |
| `design-brand-guardian` | 品牌, 品牌一致性, 视觉识别 |
| `design-visual-storyteller` | 视觉叙事, 插画, 品牌故事 |
| `design-image-prompt-engineer` | AI图像, Midjourney, DALL-E, 提示词 |
| `design-inclusive-visuals-specialist` | 包容性设计, 无障碍视觉 |
| `design-whimsy-injector` | 趣味设计, 个性化, 情感化 |

### Marketing 营销类 (11位专家)

| 专家 ID | 触发关键词 |
|---------|-----------|
| `marketing-growth-hacker` | 增长, 病毒传播, 增长实验 |
| `marketing-content-creator` | 内容创作, 故事叙述, 多平台 |
| `marketing-social-media-strategist` | 社媒策略, 社交媒体运营 |
| `marketing-twitter-engager` | Twitter, X, 实时互动 |
| `marketing-instagram-curator` | Instagram, 视觉美学 |
| `marketing-tiktok-strategist` | TikTok, 短视频 |
| `marketing-reddit-community-builder` | Reddit, 社区建设 |
| `marketing-xiaohongshu-specialist` | 小红书, 种草 |
| `marketing-zhihu-strategist` | 知乎, 知识营销 |
| `marketing-wechat-official-account` | 微信公众号 |
| `marketing-app-store-optimizer` | ASO, 应用商店优化 |

### Product 产品类 (4位专家)

| 专家 ID | 触发关键词 |
|---------|-----------|
| `product-sprint-prioritizer` | Sprint规划, 优先级, Backlog |
| `product-trend-researcher` | 趋势研究, 竞品分析, 市场 |
| `product-feedback-synthesizer` | 用户反馈, 洞察综合 |
| `product-behavioral-nudge-engine` | 行为设计, 用户参与 |

### Project Management 项目管理类 (5位专家)

| 专家 ID | 触发关键词 |
|---------|-----------|
| `project-manager-senior` | 项目管理, 需求拆解, 高级PM |
| `project-management-studio-producer` | 多项目, 工作室, 制片人 |
| `project-management-project-shepherd` | 项目跟踪, 时间线 |
| `project-management-studio-operations` | 日常运营, 流程优化 |
| `project-management-experiment-tracker` | A/B测试, 实验跟踪 |

### Testing 测试类 (8位专家)

| 专家 ID | 触发关键词 |
|---------|-----------|
| `testing-reality-checker` | 可行性验证, 现实检查 |
| `testing-evidence-collector` | 证据收集, 截图QA |
| `testing-performance-benchmarker` | 性能测试, 基准测试 |
| `testing-accessibility-auditor` | 无障碍审计, WCAG |
| `testing-api-tester` | API测试, 接口验证 |
| `testing-test-results-analyzer` | 测试分析, 质量指标 |
| `testing-tool-evaluator` | 工具评估, 技术选型 |
| `testing-workflow-optimizer` | 工作流优化, 流程改进 |

### Support 支持类 (6位专家)

| 专家 ID | 触发关键词 |
|---------|-----------|
| `support-support-responder` | 客户支持, 工单处理 |
| `support-analytics-reporter` | 数据分析, 仪表板 |
| `support-finance-tracker` | 财务, 预算管理 |
| `support-infrastructure-maintainer` | 基础设施, 系统可靠性 |
| `support-legal-compliance-checker` | 法律合规, 合规检查 |
| `support-executive-summary-generator` | 执行摘要, 高层报告 |

### Spatial Computing 空间计算类 (6位专家)

| 专家 ID | 触发关键词 |
|---------|-----------|
| `visionos-spatial-engineer` | Vision Pro, visionOS |
| `xr-immersive-developer` | VR, AR, WebXR |
| `xr-interface-architect` | XR界面, 空间交互 |
| `xr-cockpit-interaction-specialist` | 沉浸式驾驶舱 |
| `macos-spatial-metal-engineer` | Metal, Swift图形 |
| `terminal-integration-specialist` | 终端, CLI工具 |

### Specialized 专业类 (9位专家)

| 专家 ID | 触发关键词 |
|---------|-----------|
| `agents-orchestrator` | Agent编排, 多角色协调 |
| `data-analytics-reporter` | 数据分析, 商业洞察 |
| `data-consolidation-agent` | 数据整合, 多源聚合 |
| `sales-data-extraction-agent` | 销售数据, CRM |
| `report-distribution-agent` | 报告分发, 自动化 |
| `lsp-index-engineer` | 语言服务器, 语义索引 |
| `agentic-identity-trust` | Agent身份, 信任系统 |
| `specialized-developer-advocate` | 开发者关系, 社区 |
| `specialized-cultural-intelligence-strategist` | 跨文化, 本地化 |

## 目录结构

```
agency-experts/
├── SKILL.md                    # 技能定义和自动触发配置
└── references/                 # 专家参考文件
    ├── design/                 # 设计类 (8个文件)
    ├── engineering/            # 工程类 (11个文件)
    ├── marketing/              # 营销类 (11个文件)
    ├── product/                # 产品类 (4个文件)
    ├── project-management/     # 项目管理类 (5个文件)
    ├── spatial-computing/      # 空间计算类 (6个文件)
    ├── specialized/            # 专业类 (9个文件)
    ├── support/                # 支持类 (6个文件)
    └── testing/                # 测试类 (8个文件)
```

## 工作原理

1. **检测** - 分析用户任务/关键词，识别最佳专家匹配
2. **加载** - 读取对应的参考文件，获取完整专家定义
3. **采用** - 完全采用专家的角色、技能和工作流程

## 注意事项

1. **双语支持** - 所有专家都能理解和响应中英文
2. **智能匹配** - 根据任务上下文读取最相关的参考文件
3. **角色采用** - 完全体现专家的技能、工作流程和沟通风格

## 许可证

MIT License

---

<a name="english"></a>

# Agency Experts

中文 | [English](#english)

> **Original Project**: This project is based on [agency-agents](https://github.com/msitarzewski/agency-agents). Thanks to the original author for the open source contribution.

An intelligent expert system with **68 professional roles** across 9 categories. When a user task matches an expert's domain, automatically adopt that expert's persona and approach.

## Features

- **Smart Matching** - Automatically identify the best expert based on task keywords
- **Bilingual Support** - All experts understand and respond in both English and Chinese
- **Persona Adoption** - Fully embody the expert's skills, workflow, and communication style
- **Code Examples** - Each expert comes with best practice code examples

## Quick Start

### Installation

Copy the `agency-experts` folder to your Claude Code project.

### Usage

Simply describe your task and the system will automatically identify and load the relevant expert:

```
User: "Help me build a React component"
→ Match: engineering-frontend-developer
→ Load: references/engineering/engineering-frontend-developer.md

User: "Design a landing page"
→ Match: design-ui-designer
→ Load: references/design/design-ui-designer.md

User: "I need to create a growth strategy"
→ Match: marketing-growth-hacker
→ Load: references/marketing/marketing-growth-hacker.md
```

## Expert Categories

### Engineering (11 Experts)

| Expert ID | Trigger Keywords |
|-----------|-----------------|
| `engineering-frontend-developer` | React, Vue, Angular, UI implementation, responsive, frontend |
| `engineering-backend-architect` | API design, database, backend architecture, microservices |
| `engineering-senior-developer` | Full-stack, senior dev, complex implementation |
| `engineering-ai-engineer` | AI, ML, LLM, machine learning, model |
| `engineering-mobile-app-builder` | iOS, Android, mobile, App, Flutter |
| `engineering-devops-automator` | CI/CD, deployment, infrastructure, Docker, K8s |
| `engineering-security-engineer` | Security, vulnerability, audit, encryption, pentest |
| `engineering-data-engineer` | Data pipeline, ETL, data warehouse, big data |
| `engineering-rapid-prototyper` | MVP, prototype, rapid validation, PoC |
| `engineering-technical-writer` | Documentation, API docs, technical writing |
| `engineering-autonomous-optimization-architect` | Auto optimization, adaptive systems |

### Design (8 Experts)

| Expert ID | Trigger Keywords |
|-----------|-----------------|
| `design-ui-designer` | UI design, component system, visual design, interface |
| `design-ux-researcher` | UX research, user research, usability testing |
| `design-ux-architect` | UX architecture, information architecture, user flow |
| `design-brand-guardian` | Brand, brand consistency, visual identity |
| `design-visual-storyteller` | Visual storytelling, illustration, brand story |
| `design-image-prompt-engineer` | AI image, Midjourney, DALL-E, prompts |
| `design-inclusive-visuals-specialist` | Inclusive design, accessible visuals |
| `design-whimsy-injector` | Playful design, personalization, emotional |

### Marketing (11 Experts)

| Expert ID | Trigger Keywords |
|-----------|-----------------|
| `marketing-growth-hacker` | Growth, viral, growth experiments |
| `marketing-content-creator` | Content creation, storytelling, multi-platform |
| `marketing-social-media-strategist` | Social strategy, social media operations |
| `marketing-twitter-engager` | Twitter, X, real-time engagement |
| `marketing-instagram-curator` | Instagram, visual aesthetics |
| `marketing-tiktok-strategist` | TikTok, short video |
| `marketing-reddit-community-builder` | Reddit, community building |
| `marketing-xiaohongshu-specialist` | Xiaohongshu, Little Red Book |
| `marketing-zhihu-strategist` | Zhihu, knowledge marketing |
| `marketing-wechat-official-account` | WeChat Official Account |
| `marketing-app-store-optimizer` | ASO, App Store Optimization |

### Product (4 Experts)

| Expert ID | Trigger Keywords |
|-----------|-----------------|
| `product-sprint-prioritizer` | Sprint planning, priority, backlog |
| `product-trend-researcher` | Trend research, competitive analysis, market |
| `product-feedback-synthesizer` | User feedback, insight synthesis |
| `product-behavioral-nudge-engine` | Behavioral design, user engagement |

### Project Management (5 Experts)

| Expert ID | Trigger Keywords |
|-----------|-----------------|
| `project-manager-senior` | Project management, requirement breakdown, senior PM |
| `project-management-studio-producer` | Multi-project, studio, producer |
| `project-management-project-shepherd` | Project tracking, timeline |
| `project-management-studio-operations` | Daily operations, process optimization |
| `project-management-experiment-tracker` | A/B testing, experiment tracking |

### Testing (8 Experts)

| Expert ID | Trigger Keywords |
|-----------|-----------------|
| `testing-reality-checker` | Feasibility validation, reality check |
| `testing-evidence-collector` | Evidence collection, screenshot QA |
| `testing-performance-benchmarker` | Performance testing, benchmarking |
| `testing-accessibility-auditor` | Accessibility audit, WCAG |
| `testing-api-tester` | API testing, interface validation |
| `testing-test-results-analyzer` | Test analysis, quality metrics |
| `testing-tool-evaluator` | Tool evaluation, tech selection |
| `testing-workflow-optimizer` | Workflow optimization, process improvement |

### Support (6 Experts)

| Expert ID | Trigger Keywords |
|-----------|-----------------|
| `support-support-responder` | Customer support, ticket handling |
| `support-analytics-reporter` | Data analytics, dashboard |
| `support-finance-tracker` | Finance, budget management |
| `support-infrastructure-maintainer` | Infrastructure, system reliability |
| `support-legal-compliance-checker` | Legal compliance, compliance check |
| `support-executive-summary-generator` | Executive summary, high-level report |

### Spatial Computing (6 Experts)

| Expert ID | Trigger Keywords |
|-----------|-----------------|
| `visionos-spatial-engineer` | Vision Pro, visionOS |
| `xr-immersive-developer` | VR, AR, WebXR |
| `xr-interface-architect` | XR interface, spatial interaction |
| `xr-cockpit-interaction-specialist` | Immersive cockpit |
| `macos-spatial-metal-engineer` | Metal, Swift graphics |
| `terminal-integration-specialist` | Terminal, CLI tools |

### Specialized (9 Experts)

| Expert ID | Trigger Keywords |
|-----------|-----------------|
| `agents-orchestrator` | Agent orchestration, multi-role coordination |
| `data-analytics-reporter` | Data analytics, business insights |
| `data-consolidation-agent` | Data consolidation, multi-source aggregation |
| `sales-data-extraction-agent` | Sales data, CRM |
| `report-distribution-agent` | Report distribution, automation |
| `lsp-index-engineer` | Language server, semantic indexing |
| `agentic-identity-trust` | Agent identity, trust system |
| `specialized-developer-advocate` | Developer relations, community |
| `specialized-cultural-intelligence-strategist` | Cross-cultural, localization |

## Directory Structure

```
agency-experts/
├── SKILL.md                    # Skill definition and auto-trigger config
└── references/                 # Expert reference files
    ├── design/                 # Design (8 files)
    ├── engineering/            # Engineering (11 files)
    ├── marketing/              # Marketing (11 files)
    ├── product/                # Product (4 files)
    ├── project-management/     # Project Management (5 files)
    ├── spatial-computing/      # Spatial Computing (6 files)
    ├── specialized/            # Specialized (9 files)
    ├── support/                # Support (6 files)
    └── testing/                # Testing (8 files)
```

## How It Works

1. **Detect** - Analyze user's task/keywords to identify the best expert match
2. **Load** - Read the corresponding reference file for full expert definition
3. **Adopt** - Embody the expert's persona, skills, and workflow

## Notes

1. **Bilingual Support** - All experts understand and respond in both English and Chinese
2. **Smart Matching** - Read the most relevant reference file based on task context
3. **Persona Adoption** - Fully embody the expert's skills, workflow, and communication style

## License

MIT License
