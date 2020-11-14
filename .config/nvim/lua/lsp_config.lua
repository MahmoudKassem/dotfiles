--configure completion
local nvim_lsp = require('nvim_lsp')
local on_attach = function (client)
  require('completion').on_attach(client)
end

--gopls for golang
nvim_lsp.gopls.setup {
  on_attach = on_attach
}

--haskell language server for haskell
nvim_lsp.hls.setup {
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern(
    "*.cabal", "stack.yaml", "cabal.project", "package.yaml", "hie.yaml", ".git"
  )
}

--vim language server for vim
nvim_lsp.vimls.setup {
  on_attach = on_attach
}

--sumneko for lua
local language_server_path = os.getenv("XDG_CACHE_HOME") .. "/nvim/nvim_lsp/sumneko_lua"
nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  cmd = {
    string.format("%s/lua-language-server/bin/Linux/lua-language-server", language_server_path),
    "-E", string.format("%s/sumneko_lua/lu--language-server/main.lua", language_server_path)
  }
}

--configure diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = false,
    underline = true,
    update_in_insert = false,
    virtual_text = {
      spacing = 2,
      prefix = ''
    },
  }
)
