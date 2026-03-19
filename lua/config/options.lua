-- 基础 Neovim 选项配置
local opt = vim.opt

-- 编辑器基础设置
opt.number = true -- 行号
opt.relativenumber = true -- 相对行号
opt.cursorline = true -- 高亮当前行
-- opt.colorcolumn = "100" -- 100 字符参考线（已禁用）

-- 缩进设置
opt.expandtab = true -- 使用空格代替 Tab
opt.shiftwidth = 2 -- 自动缩进宽度
opt.tabstop = 2 -- Tab 宽度
opt.softtabstop = 2 -- 软 Tab 宽度

-- 搜索设置
opt.ignorecase = true -- 忽略大小写
opt.smartcase = true -- 智能大小写
opt.incsearch = true -- 增量搜索

-- 外观设置
opt.termguicolors = true -- 真彩色支持
opt.signcolumn = "yes" -- 始终显示符号列
opt.splitbelow = true -- 水平分割窗口在下方
opt.splitright = true -- 垂直分割窗口在右侧

-- 性能优化
opt.updatetime = 200 -- 更新时间（毫秒）
opt.timeoutlen = 300 -- 按键超时时间

-- 其他
opt.undofile = true -- 持久化撤销
opt.clipboard = "unnamedplus" -- 使用系统剪贴板
opt.mouse = "a" -- 启用鼠标支持

-- 禁用 LazyVim 自动根目录检测，使用当前工作目录 (cwd)
vim.g.root_spec = { "cwd" }

-- 透明背景（支持终端毛玻璃效果）
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE" })
    end,
})
