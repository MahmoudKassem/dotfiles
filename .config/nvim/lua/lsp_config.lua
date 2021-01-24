--configure completion
local lsp_config = require('lspconfig')
local on_attach = function (client)
  require('completion').on_attach(client)
end

--gopls for golang
lsp_config.gopls.setup {
  on_attach = on_attach
}

--haskell language server for haskell
lsp_config.hls.setup {
  on_attach = on_attach,
  root_dir = lsp_config.util.root_pattern(
    "*.cabal", "stack.yaml", "cabal.project", "package.yaml", "hie.yaml", ".git"
  )
}

--vim language server for vim
lsp_config.vimls.setup {
  on_attach = on_attach
}

--sumneko for lua
lsp_config.sumneko_lua.setup {
  on_attach = on_attach,
  cmd = { "lua-language-server", "-E", "/usr/local/share/lua-language-server/main.lua" }
}

--configure diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = false,
    underline = true,
    update_in_insert = true,
    virtual_text = {
      spacing = 2,
      prefix = ''
    },
  }
)
