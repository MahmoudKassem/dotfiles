local globalVariables = vim.g
globalVariables.completion_matching_smart_case = 1
globalVariables.completion_matching_strategy_list = {"exact", "substring", "fuzzy"}
globalVariables.completion_sorting = "none"

local lsp_config = require('lspconfig')
local on_attach = require('completion').on_attach()

lsp_config.gopls.setup {
  on_attach = on_attach
}

lsp_config.hls.setup {
  on_attach = on_attach,
  root_dir = lsp_config.util.root_pattern(
    "*.cabal", "stack.yaml", "cabal.project", "package.yaml", "hie.yaml", ".git"
  )
}

lsp_config.sumneko_lua.setup {
  on_attach = on_attach,
  cmd = { "lua-language-server", "-E", "/usr/local/share/lua-language-server/main.lua" },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    }
  }
}

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
