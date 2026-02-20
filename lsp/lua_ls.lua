-- 这是专门给 lua-language-server 的“调校说明书”
return {
  settings = {
    Lua = {
      diagnostics = {
        -- 核心：告诉 LSP，vim 是全局变量，别再报错了！
        globals = { "vim" },
      },
      workspace = {
        -- 让 LSP 认识 Neovim 的运行时文件，这样补全会更强
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

