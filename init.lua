-- Ensure packer is installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()

-- Packer setup
require('packer').startup(function(use)
  -- Packer manages itself
  use 'wbthomason/packer.nvim'

  -- Add Cyberdream plugin
  use {
    'scottmckendry/cyberdream.nvim',
    config = function()
      -- Set the colorscheme to Cyberdream
      vim.cmd('colorscheme cyberdream')

      -- Optional customization for Cyberdream
      vim.g.cyberdream_background = 'cyberdream'     -- Options: 'dark' or 'light'
      vim.g.cyberdream_disable_italics = true   -- Disable italics
      vim.g.cyberdream_bold_comments = true     -- Enable bold comments
    end
  }

  -- Example of another plugin you might have wanted
  -- use 'another/plugin'

  -- Bootstrap packer if necessary
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- General Neovim settings (based on your previous setup)
vim.opt.number = true            -- Show line numbers
vim.opt.relativenumber = true    -- Relative line numbers
vim.opt.mouse = 'a'             -- Enable mouse support
vim.opt.tabstop = 4             -- Set tab width to 4
vim.opt.shiftwidth = 4          -- Set indentation width to 4
vim.opt.expandtab = true        -- Convert tabs to spaces
vim.opt.smartindent = true      -- Smart indentation
vim.opt.autoindent = true       -- Enable auto indentation
vim.opt.hlsearch = true         -- Highlight search results
vim.opt.incsearch = true        -- Incremental search
vim.opt.termguicolors = true    -- Enable 24-bit RGB color support
vim.opt.clipboard = 'unnamedplus' -- Use system clipboard

-- Key mappings
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })

-- Example of a plugin that you might have wanted (e.g., telescope)
-- require('telescope').setup{}
-- vim.api.nvim_set_keymap('n', '<Leader>ff', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true })

-- Example: Enable line numbers and relative line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Example: Set up lualine (statusline)
-- require('lualine').setup {
--   options = {
--     theme = 'cyberdream',  -- Use the Cyberdream theme for the statusline
--   }
-- }

