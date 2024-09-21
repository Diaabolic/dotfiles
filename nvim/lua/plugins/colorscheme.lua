return {
  "craftzdog/solarized-osaka.nvim",
  "catppuccin/nvim",
  "tokyonight.nvim",
  "ellisonleao/gruvbox.nvim",
  "EdenEast/nightfox.nvim",
  "rebelot/kanagawa.nvim",
  lazy = true,
  priority = 1000,
  opts = function()
    return {
      transparent = true,
    }
  end,
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
