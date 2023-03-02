-- 基础设置
require('basic')
-- 快捷键
require('keybindings')
-- plugins
require('plugins')
-- 主题设置 （新增）
require("colorscheme")
-- 插件配置
require("plugin-config.nvim-tree")
-- 顶部标签栏
require("plugin-config.bufferline")
-- 底部状态栏
require("plugin-config.lualine")
-- telescope
require("plugin-config.telescope")

require("plugin-config.dashboard")
require("plugin-config.project")
require("plugin-config.nvim-treesitter")
-- 内置LSP
-- require("lsp.setup")
require("lsp.cmp")
require("lsp.ui")