-- 语言服务配置
return {
  -- Mason: 手动安装 LSP（禁用自动安装避免冲突）
  {
    "mason-org/mason.nvim",
    opts = {
      -- 清空 ensure_installed，改为手动安装
      ensure_installed = {},
    },
  },

  -- 禁用 mason-lspconfig 的自动安装
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {},
      automatic_installation = false,
    },
  },

  -- jdtls 配置：指定 Java 21 路径运行 jdtls
  {
    "mfussenegger/nvim-jdtls",
    init = function()
      -- 仅为 jdtls 设置 JAVA_HOME，不影响系统环境
      vim.env.JAVA_HOME = "/Users/leafw/Documents/env/jdk-21.0.10.jdk/Contents/Home"
    end,
  },
}
