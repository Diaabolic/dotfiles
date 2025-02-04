local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = {
        news = {
          lazyvim = true,
          neovim = true,
        },
      },
    },
    -- import any extras modules here
    { import = "lazyvim.plugins.extras.linting.eslint" },
    { import = "lazyvim.plugins.extras.formatting.prettier" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.json" },
    -- { import = "lazyvim.plugins.extras.lang.markdown" },
    { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "lazyvim.plugins.extras.lang.tailwind" },
    -- { import = "lazyvim.plugins.extras.dap.core" },
    -- { import = "lazyvim.plugins.extras.vscode" },
    { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
    -- { import = "lazyvim.plugins.extras.test.core" },
    -- { import = "lazyvim.plugins.extras.coding.yanky" },
    -- { import = "lazyvim.plugins.extras.editor.mini-files" },
    -- { import = "lazyvim.plugins.extras.util.project" },
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  dev = {
    path = "~/.ghq/github.com",
  },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    cache = {
      enabled = true,
      -- disable_events = {},
    },
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        "netrwPlugin",
        "rplugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  ui = {
    custom_keys = {
      ["<localleader>d"] = function(plugin)
        dd(plugin)
      end,
    },
  },
  debug = false,
})

-- Function to apply transparency settings globally
local function set_transparency()
  vim.cmd([[
hi Normal guibg=NONE ctermbg=NONE
hi NormalNC guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi StatusLine guibg=NONE ctermbg=NONE
hi StatusLineNC guibg=NONE ctermbg=NONE
hi VertSplit guibg=NONE ctermbg=NONE
hi TabLine guibg=NONE ctermbg=NONE
hi TabLineFill guibg=NONE ctermbg=NONE
hi TabLineSel guibg=NONE ctermbg=NONE
hi Pmenu guibg=NONE ctermbg=NONE
hi PmenuSel guibg=NONE ctermbg=NONE
hi NeoTreeNormal guibg=NONE ctermbg=NONE
hi NeoTreeNormalNC guibg=NONE ctermbg=NONE
hi NeoTreeWinSeparator guibg=NONE ctermbg=NONE
hi CursorLineNr guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
]])
end

-- Apply transparency settings initially
set_transparency()

-- Set up neo-tree with default settings and no custom mappings
require("neo-tree").setup({
  window = {
    -- Use default settings with no custom mappings
    width = 20,
  },
})

-- Reapply transparency on buffer enter
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = set_transparency,
})
