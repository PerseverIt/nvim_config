return {
  "neovim/nvim-lspconfig",
  dependencies = { "hrsh7th/cmp-nvim-lsp" }, -- 确保在配置 lsp 前加载了 cmp 的桥梁
  config = function()
    -- 1. 设置 Mason 路径
    vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. ":" .. vim.env.PATH

    -- 2. 获取 cmp 提供的能力声明
    -- 这行代码是连接 LSP 和 补全窗口的“秘密协议”
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- 3. 批量配置并启动
    local servers = { 'lua_ls', 'clangd', 'rust_analyzer', 'makefile_language_server' }

    for _, server in ipairs(servers) do
      -- 先进行配置：注入 capabilities
      vim.lsp.config(server, {
        capabilities = capabilities
      })
      -- 然后启用
      vim.lsp.enable(server)
    end
  end
}

