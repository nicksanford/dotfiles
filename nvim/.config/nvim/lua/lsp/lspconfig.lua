local on_attach = function(args)
  local bufnr = args.buf
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  -- keybind options
  local telescope_builtin = require('telescope.builtin')
  local lsp_references = function()
    telescope_builtin.lsp_references({ include_declaration = false, show_line = false })
  end
  local keymap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set("n", keys, func, { noremap = true, silent = true, buffer = bufnr, desc = desc })
  end


  -- LSPSAGA
  -- Diagnostics
  keymap("<leader>[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Prev Diagnostic")        -- jump to previous diagnostic in buffer
  keymap("<leader>]", "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic")        -- jump to next diagnostic in buffer
  keymap("<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", "Line [D]iagnostic")     -- show  diagnostics for line
  keymap("<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", "Cursor [d]iagnostic") -- show diagnostics for cursor
  -- Outline
  keymap("<leader>o", "<cmd>Lspsaga outline<CR>", "[o]utline")                           -- see outline on right hand side
  -- See `:help K` for why this keymap
  keymap("K", "<cmd>Lspsaga hover_doc<CR>", "hovor doc")                                 -- show documentation for what is under cursor
  -- keymap("<leader>ca", "<cmd>Lspsaga code_action<CR>", "[c]ode [a]ction")                -- see available code actions
  -- keymap("<leader>gt", "<cmd>Lspsaga peek_definition<CR>", "Peak Definition")        -- see definition and make edits in window
  keymap("<leader>gf", "<cmd>Lspsaga finder<CR>", "[go] [finder]") -- show definition, references
  keymap('<leader>q', vim.diagnostic.setloclist, "[q]uickfix")


  -- Formatter
  nmap("f", vim.lsp.buf.format, "[f]ormat")

  -- Code Lense (not yet working)
  keymap("<leader>cl", vim.lsp.codelens.run, "[c]ode [l]ense")

  -- Rename
  nmap('<leader>rn', vim.lsp.buf.rename, '[l]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')


  -- Navigation
  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('gT', vim.lsp.buf.type_definition, '[G]oto [T]ype definition')
  -- nmap('<leader>ds', telescope_builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
  -- nmap('<leader>ws', telescope_builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  nmap('gR', lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')



  keymap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  awk_ls = true,
  bashls = true,
  -- bufls = {},
  clangd = true,
  cmake = true,
  elixirls = {
    dialyzerEnabled = true,
    fetchDeps = false,
    enableTestLenses = false,
    suggestSpecs = true,
  },
  -- shellcheck = {},
  -- shfmt = {},
  golangci_lint_ls = true,
  gopls = true,
  html = true,
  jsonls = true,
  marksman = true,
  pyright = true,
  rust_analyzer = true,
  taplo = true,
  lua_ls = {
    cmd = { "lua-language-server" },
    Lua = {
      runtime = {
        version = 'LuaJIT'
      },
      -- make the language server recognise "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      telemetry = { enable = false },
      workspace = {
        checkThirdParty = false,
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        }
      }
    }
  },
  zls = true,
}

-- Setup neovim lua configuration
-- require('neodev').setup()
--
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require('mason-lspconfig')


mason_lspconfig.setup({
  ensure_installed = vim.tbl_keys(servers),
})


vim.api.nvim_create_autocmd('LspAttach', {
  callback = on_attach,
})

-- Set global capabilities for all LSP servers
vim.lsp.config("*", {
  capabilities = capabilities,
})

for name, config in pairs(servers) do
  if config == true then
    config = {}
  end

  if next(config) ~= nil then
    vim.lsp.config(name, config)
    vim.lsp.enable(name)
  end
end

-- Turn on lsp status information
-- require('fidget').setup({})
