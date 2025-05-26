-- file navigation - neo-tree
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",  
  keys = {
    { "<C-n>", function()
        require("neo-tree.command").execute({
          toggle = true,
          dir = vim.loop.cwd(), 
        })
      end,
      desc = "Toggle Neo-tree"
    }
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      enable_git_status = true,
      enable_diagnostics = true,
      window = {
        position = "left",
        width = 45,
        mappings = {
          ["<space>"] = "none", 
        },
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
        hijack_netrw_behavior = "open_default",
        use_libuv_file_watcher = true,
      },
    })
  end,
}
