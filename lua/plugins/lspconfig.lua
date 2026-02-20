return {
  "neovim/nvim-lspconfig",
  config = function()
    -- 1. 让 Neovim 找到 Mason 安装的二进制文件 (ArchLinux 用户必备)
    vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. ":" .. vim.env.PATH

    -- 2. 批量启用你想要的服务
    -- 注意：这些名字必须和 lsp/ 文件夹下的文件名（不含.lua）一一对应
    local servers = {
      'lua_ls',
      'clangd',
      'rust_analyzer',  -- 确保这里是下划线
    }

    for _, server in ipairs(servers) do
      vim.lsp.enable(server)
    end
  end
}
