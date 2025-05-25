return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        PATH = "prepend"
      })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "elixirls", "python", "rust_analyzer" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.rust_analyzer.setup({
        settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
						},
						imports = {
							group = {
								enable = false,
							},
						},
						completion = {
							postfix = {
								enable = false,
							},
						},
					},
				},
      })
      lspconfig.lua_ls.setup({})
      lspconfig.elixirls.setup({
        -- git clone https://github.com/elixir-lsp/elixir-ls.git ~/.elixir-ls
        -- cd ~/.elixir-ls
        -- mix deps.get && mix compile && mix elixir_ls.release -o release
        -- Then add to PATH
        cmd = { "/Users/radekpistelak/.elixir-ls/release/language_server.sh" },
      })
      lspconfig.pyright.setup({
        settings = {
          -- Ruff language server settings go here
        }
      })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<Space>ca', vim.lsp.buf.code_action, {})
      vim.keymap.set('n', '<Space>ge', vim.diagnostic.open_float, {})
    end
  }
}
