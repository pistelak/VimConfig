return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        require("none-ls.diagnostics.eslint"),
        null_ls.builtins.formatting.prettier,
      }
    })

    vim.keymap.set('n', '<Space>gf', vim.lsp.buf.format, {})
  end
}
