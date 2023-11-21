return {
  {
    "Mofiqul/dracula.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
        italic_comment = true,
      }
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
}
