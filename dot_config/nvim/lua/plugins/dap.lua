return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>d"] = { name = "+debug" },
      },
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    config = function()
      require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
      -- setup dap config by VsCode launch.json file
      require("dap.ext.vscode").load_launchjs(vim.fn.getcwd() .. "/.vscode/launch.json", {})
      --
      -- local dap = require("dap")
      -- table.insert(dap.configurations.python, {
      --   type = "python",
      --   request = "launch",
      --   module = "flask",
      --   name = "APP SBF",
      --   python = vim.fn.getcwd() .. "/venv/bin/python",
      --   args = { "run", "--no-debugger", "--no-reload" },
      --   env = {
      --     FLASK_APP = "appsbf",
      --     FLASK_DEBUG = "1",
      --   },
      --   jinja = true,
      --   justMyCode = true,
      --   console = "integratedTerminal",
      -- })
    end,
    keys = {
      {
        "<leader>dPt",
        function()
          require("dap-python").test_method()
        end,
        desc = "Debug Method",
        ft = "python",
      },
      {
        "<leader>dPc",
        function()
          require("dap-python").test_class()
        end,
        desc = "Debug Class",
        ft = "python",
      },
    },
  },
}
