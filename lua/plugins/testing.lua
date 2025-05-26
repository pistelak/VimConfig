return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/nvim-nio",
    "rouge8/neotest-rust",
  },
  config = function()
    local neotest = require("neotest")
    neotest.setup({
      adapters = {
        require("neotest-rust")({
          nextest = false
        })
      }
    })

    -- Keybindings
    vim.keymap.set("n", "<Space>tf", function()
      neotest.run.run(vim.fn.expand("%"))
    end, { desc = "Run tests in current file" })

    vim.keymap.set("n", "<Space>tn", function()
      neotest.run.run()
    end, { desc = "Run nearest test" })

    vim.keymap.set("n", "<Space>ts", function()
      neotest.summary.toggle()
    end, { desc = "Toggle summary panel" })

    vim.keymap.set("n", "<Space>to", function()
      neotest.output.open({ enter = true })
    end, { desc = "Open test output" })
  end
}
