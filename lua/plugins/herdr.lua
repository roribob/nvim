-- https://github.com/ChmaraX/herdr-nvim
local nvimIntegration = {
  "ChmaraX/herdr-nvim",
  opts = {},
}

-- https://github.com/aimdevlee/herdr-nvim-nav
local nvimNav = {
  'aimdevlee/herdr-nvim-nav',
  -- dependencies = { 'christoomey/vim-tmux-navigator' }, -- omit if with_tmux = false
  config = function()
    require('herdr-nvim-nav').setup()
  end,
}

return {
  nvimIntegration,
  nvimNav,
}
