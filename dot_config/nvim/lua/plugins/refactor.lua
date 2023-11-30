return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>r"] = { name = "+refactor" },
      },
    },
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
    keys = {
      {
        "<leader>rf",
        function()
          require("refactoring").refactor("Extract Function")
        end,
        mode = { "x" },
        desc = "Extract Function",
      },
      {
        "<leader>rv",
        function()
          require("refactoring").refactor("Extract Variable")
        end,
        mode = { "x" },
        desc = "Extract Variable",
      },
      {
        "<leader>rb",
        function()
          require("refactoring").refactor("Extract Block")
        end,
        mode = { "n" },
        desc = "Extract Variable",
      },
    },
  },
  -- add refactoring to telescope
  {
    "telescope.nvim",
    dependencies = {
      "ThePrimeagen/refactoring.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("refactoring")
      end,
    },
    keys = {
      {
        "<leader>rr",
        function()
          require("telescope").extensions.refactoring.refactors()
        end,
        mode = { "n", "x" },
        desc = "Refactor prompt",
      },
    },
  },
}
