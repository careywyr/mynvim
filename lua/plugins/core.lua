-- 核心功能配置
return {
  -- Catppuccin 主题
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = true, -- 透明背景
    },
  },

  -- 设置默认主题
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  -- 启用 Snacks.nvim（包含 picker、dashboard 等）
  {
    "folke/snacks.nvim",
    opts = {
      -- Picker 配置（替代 Telescope）
      picker = {
        sources = {
          files = {
            hidden = false,
            ignored = false,
            exclude = {
              "target", "build", "dist", "out",
              "node_modules", ".git", "__pycache__",
              "*.class", "*.jar", "*.war", "*.ear",
              "*.pyc", ".idea", ".vscode",
            },
          },
          git_files = {},
          grep = {
            exclude = {
              "target", "build", "dist", "out",
              "node_modules", ".git", "__pycache__",
              "*.class", "*.jar", "*.war", "*.ear",
              "*.pyc", ".idea", ".vscode",
            },
          },
          explorer = {
            exclude = {
              "target", "build", "dist", "out",
              "node_modules", ".git", "__pycache__",
              "*.class", "*.jar", "*.war", "*.ear",
              "*.pyc", ".idea", ".vscode",
            },
          },
          buffers = {},
          oldfiles = {},
        },
        wins = {
          input = {
            keys = {
              ["<esc>"] = "close",
              ["<C-c>"] = "close",
            },
          },
        },
      },
      -- Dashboard 启动屏幕（禁用，直接进入文件树）
      dashboard = {
        enabled = false,
      },
    },
    keys = {
      -- 快捷键映射
      { "<C-p>", function() Snacks.picker.files() end, desc = "Find Files" },
      { "<leader><space>", function() Snacks.picker.files() end, desc = "Find Files" },
      { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep (root dir)" },
      { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Grep word" },
      { "<leader>sb", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>sr", function() Snacks.picker.oldfiles() end, desc = "Recent Files" },
      { "<leader>sf", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config Files" },
      -- Git 相关
      { "<leader>sc", function() Snacks.picker.git_commits() end, desc = "Git Commits" },
      { "<leader>ss", function() Snacks.picker.git_status() end, desc = "Git Status" },
      -- LSP 相关
      { "<leader>sd", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
      { "<leader>sD", function() Snacks.picker.lsp_definitions() end, desc = "LSP Definitions" },
      { "<leader>sR", function() Snacks.picker.lsp_references() end, desc = "LSP References" },
      { "<leader>si", function() Snacks.picker.lsp_implementations() end, desc = "LSP Implementations" },
      -- 其他
      { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
      { "<leader>so", function() Snacks.picker.options() end, desc = "Options" },
      { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
      { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
      { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
    },
  },

  -- Neo-tree 文件树配置（类似 VSCode 左侧边栏）
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      close_if_last_window = true, -- 最后一个窗口关闭时自动退出
      window = {
        position = "left",
        width = 30,
      },
      filesystem = {
        bind_to_cwd = true, -- 绑定到当前工作目录
        cwd_target = {
          sidebar = "global", -- 使用全局 cwd
        },
        follow_current_file = { enabled = true }, -- 跟随当前文件
        filtered_items = {
          hide_dotfiles = false, -- 显示隐藏文件
          hide_gitignored = false,
        },
      },
      source_selector = {
        winbar = true,
        content_layout = "center",
      },
    },
  },

  -- 禁用 Telescope（使用 Snacks.picker 替代）
  { "nvim-telescope/telescope.nvim", enabled = false },

  -- 自动切换输入法（退出插入模式时切换回英文）
  {
    "keaising/im-select.nvim",
    event = "InsertEnter",
    opts = {
      default_im_select = "com.apple.keylayout.ABC", -- macOS 英文输入法
      default_command = "im-select",
      set_previous_events = {}, -- 不恢复之前的输入法
    },
  },
}
