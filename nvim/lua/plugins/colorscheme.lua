return {
  {
    "craftzdog/solarized-osaka.nvim",
    "catppuccin/nvim",
    "tokyonight.nvim",
    "ellisonleao/gruvbox.nvim",
    "EdenEast/nightfox.nvim",
    "rebelot/kanagawa.nvim",
    "vague2k/vague.nvim",
    "ellisonleao/gruvbox.nvim",
    "techtuner/aura-neovim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false,
      styles = {
        sidebars = "trasnparent",
        floats = "transparent",
      },
    },
    config = function()
      require("gruvbox").setup({
        transparent = false,
        contrast = "hard",
        transparent_mode = true,
      })
      require("vague").setup({
        transparent = true,
        style = {
          boolean = "none",
          number = "none",
          float = "none",
          error = "none",
          comments = "none",
          conditionals = "none",
          functions = "none",
          headings = "bold",
          operators = "none",
          strings = "none",
          variables = "none",
          keywords = "none",
          keyword_return = "none",
          keywords_loop = "none",
          keywords_label = "none",
          keywords_exception = "none",
          builtin_constants = "none",
          builtin_functions = "none",
          builtin_types = "none",
          builtin_variables = "none",
        },
        colors = {
          func = "#bc96b0",
          keyword = "#787bab",
          -- string = "#d4bd98",
          string = "#8a739a",
          -- string = "#f2e6ff",
          -- number = "#f2e6ff",
          -- string = "#d8d5b1",
          number = "#8f729e",
          -- type = "#dcaed7",
        },
      })
      vim.cmd.colorscheme("vague")
    end,
  },
  {
    "jnurmine/Zenburn",
  },
  {
    "RRethy/base16-nvim",
  },

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
      colorscheme = "aura",
      -- colorscheme = "solarized-osaka",
    },
  },
}
