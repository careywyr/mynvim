-- 语言服务配置
return {
  -- Mason: 手动安装 LSP（禁用自动安装避免冲突）
  {
    "williamboman/mason.nvim",
    opts = {
      -- 清空 ensure_installed，改为手动安装
      ensure_installed = {},
    },
  },

  -- 禁用 mason-lspconfig 的自动安装
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {},
      automatic_installation = false,
    },
  },
}
