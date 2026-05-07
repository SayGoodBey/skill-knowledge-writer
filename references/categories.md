# 分类体系参考

本文档定义知识库的分类体系，供 AI 判断知识归属时参考。

## 当前分类

### AI 方向
| 子分类 | 路径 | 涵盖内容 |
|--------|------|----------|
| 工作流 | `topics/ai/workflow/` | Agent 编排、Pipeline、DAG、LangGraph、Dify |
| MCP | `topics/ai/mcp/` | Model Context Protocol、工具注册、Server/Client |
| Skill | `topics/ai/skill/` | OpenClaw Skill、SKILL.md 规范、技能设计 |

### Kubernetes 方向
| 子分类 | 路径 | 涵盖内容 |
|--------|------|----------|
| Node | `topics/k8s/node/` | 节点管理、调度、污点容忍、标签选择器 |
| Deployment | `topics/k8s/deployment/` | 部署策略、滚动更新、回滚、HPA |
| Pod | `topics/k8s/pod/` | 生命周期、Init Container、Sidecar、探针 |
| PV/PVC | `topics/k8s/pv-pvc/` | 持久卷、存储类、动态供给、CSI |
| Service | `topics/k8s/service/` | ClusterIP、NodePort、LoadBalancer、Ingress |

### 其他
| 子分类 | 路径 | 涵盖内容 |
|--------|------|----------|
| 工具 | `topics/tools/` | Git、Docker、Shell、IDE、效率工具 |
| 其他 | `topics/misc/` | 无法归入以上分类的知识 |

## 分类判断规则

1. **优先精确匹配**: 内容明确属于某子分类则直接归入
2. **关键词辅助**: 参考 SKILL.md 中的关键词表
3. **新建分类**: 如果同一新方向出现 2+ 次，创建新子分类目录
4. **避免碎片化**: 单次出现的零散知识归入 `misc/`

## 扩展分类（按需创建）

当以下方向的知识积累到一定量时，可创建独立分类：
- `topics/golang/` - Go 语言
- `topics/network/` - 网络
- `topics/database/` - 数据库
- `topics/linux/` - Linux 系统
- `topics/security/` - 安全
