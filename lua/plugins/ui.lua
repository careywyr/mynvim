-- UI 美化配置
return {
  -- 禁用 alpha（使用 Snacks dashboard 替代，避免冲突）
  { "goolord/alpha-nvim", enabled = false },

  -- 禁用 nvim-dap 相关插件（避免配置错误）
  { "mfussenegger/nvim-dap", enabled = false },
  { "rcarriga/nvim-dap-ui", enabled = false },
  { "jay-babu/mason-nvim-dap.nvim", enabled = false },

  -- 状态栏配置
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      -- 自定义组件函数
      local function file_encoding()
        local enc = vim.bo.fileencoding or vim.bo.encoding
        return enc:upper()
      end

      local function file_format()
        local format = vim.bo.fileformat
        local format_map = {
          unix = "LF",
          dos = "CRLF",
          mac = "CR",
        }
        return format_map[format] or format:upper()
      end

      local function current_time()
        return os.date("%H:%M")
      end

      return {
        options = {
          theme = "tokyonight",
          globalstatus = true, -- 全局状态栏
          component_separators = { left = "|", right = "|" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = { "dashboard", "alpha", "starter" },
          },
        },
        sections = {
          -- 左侧: 模式 + 文件路径 + Git 分支
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff" },
          lualine_c = {
            { "filename", path = 4 }, -- 显示完整文件路径
          },

          -- 右侧: 诊断 + LSP + 位置 + 编码 + 换行符 + 时间
          lualine_x = {
            { "diagnostics", sources = { "nvim_diagnostic" } },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { file_encoding, separator = "", padding = { left = 1, right = 0 } },
            { file_format, separator = "", padding = { left = 1, right = 1 } },
          },
          lualine_y = {
            { "location", padding = { left = 0, right = 1 } }, -- 行:列
          },
          lualine_z = {
            { current_time, padding = { left = 0, right = 1 } },
          },
        },
        inactive_sections = {
          lualine_c = {
            { "filename", path = 4 },
          },
          lualine_x = { "location" },
        },
      }
    end,
  },

  -- 启用漂亮的 indent-blankline (v3)
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { enabled = false },
    },
  },
}
