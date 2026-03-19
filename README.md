# Neovim 配置

基于 [LazyVim](https://github.com/LazyVim/LazyVim) 的极简 Neovim 配置。

## 安装

### 依赖

```bash
# macOS
brew install neovim ripgrep fd
brew tap daipeihust/tap && brew install im-select
```

### 安装配置

```bash
# 备份旧配置（如有）
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak

# 克隆配置
git clone git@github.com:careywyr/mynvim.git ~/.config/nvim

# 配置搜索排除规则（排除 target、node_modules 等）
mkdir -p ~/.config/fd
cat > ~/.config/fd/ignore << 'EOF'
target/
build/
dist/
out/
node_modules/
.git/
__pycache__/
.idea/
.vscode/
*.class
*.jar
*.war
*.ear
*.pyc
*.pyo
EOF

# 启动 Neovim（自动安装插件）
nvim
```

### 安装 LSP 服务器

首次启动后，运行 `:Mason` 手动安装需要的 LSP：
- `lua-language-server` - Lua
- `pyright` - Python
- `typescript-language-server` - TypeScript/JavaScript
- `gopls` - Go
- `jdtls` - Java

## 快捷键

> `<leader>` 键是 **空格键**

### 文件操作

| 快捷键 | 功能 |
|--------|------|
| `<C-p>` | 搜索文件 |
| `<Option-o>` | 搜索文件 |
| `<Option-p>` | 搜索文件 |
| `<leader><space>` | 搜索文件 |
| `<leader>e` | 打开/关闭文件树 |
| `<leader>sg` | 全局文本搜索 (grep) |
| `<Option-f>` | 全局文本搜索 |
| `<leader>sw` | 搜索光标下的单词 |
| `<leader>sr` | 最近打开的文件 |
| `<leader>sb` | 切换 Buffer |
| `<leader>sf` | 搜索 Neovim 配置文件 |

### Buffer/窗口

| 快捷键 | 功能 |
|--------|------|
| `<S-h>` | 上一个 Buffer |
| `<S-l>` | 下一个 Buffer |
| `<leader>bd` | 关闭当前 Buffer |
| `<C-h/j/k/l>` | 窗口间移动 |
| `<leader>-` | 水平分割 |
| `<leader>\|` | 垂直分割 |

### 编辑

| 快捷键 | 功能 |
|--------|------|
| `u` | 撤销 |
| `<C-r>` | 重做 |
| `gcc` | 注释/取消注释当前行 |
| `gc` + 移动 | 注释选中区域 |
| `<leader>cf` | 格式化代码 |

### LSP（代码智能）

| 快捷键 | 功能 |
|--------|------|
| `gd` | 跳转到定义 |
| `gr` | 查看引用 |
| `K` | 显示悬浮文档 |
| `<leader>ca` | 代码操作 (Code Action) |
| `<leader>cr` | 重命名符号 |

### Git

| 快捷键 | 功能 |
|--------|------|
| `<leader>gg` | 打开 lazygit |
| `<leader>sc` | Git commits |
| `<leader>ss` | Git status |

### 其他

| 快捷键 | 功能 |
|--------|------|
| `<leader>l` | 打开 Lazy 插件管理器 |
| `<leader>sk` | 查看所有快捷键 |
| `:Mason` | 打开 LSP 管理器 |

## 功能特性

- **文件树** - Neo-tree（左侧边栏，类似 VSCode）
- **文件搜索** - Snacks.picker（快速模糊搜索）
- **全局搜索** - ripgrep 支持正则表达式
- **搜索排除** - 自动忽略 target/build/node_modules 等目录
- **LSP 补全** - 支持 Python/TypeScript/JavaScript/Go/Lua/Java
- **状态栏** - 显示分支、换行符、行列、字符集、时间
- **主题** - Catppuccin（支持透明背景）
- **输入法切换** - 退出插入模式自动切换英文
- **透明背景** - 支持终端毛玻璃效果（如 Ghostty）

## 目录结构

```
~/.config/nvim/
├── init.lua              # 入口文件
├── lazy-lock.json        # 插件版本锁定
├── lazyvim.json          # LazyVim extras 配置
└── lua/
    ├── config/
    │   ├── autocmds.lua  # 自动命令
    │   ├── keymaps.lua   # 自定义快捷键
    │   ├── lazy.lua      # lazy.nvim 配置
    │   └── options.lua   # 编辑器选项
    └── plugins/
        ├── core.lua      # 核心插件配置
        ├── lsp.lua       # LSP 配置
        └── ui.lua        # UI 配置

~/.config/fd/
└── ignore                # fd 全局忽略配置（搜索排除规则）
```
