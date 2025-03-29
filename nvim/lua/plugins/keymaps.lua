return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup()
      
      -- Window navigation
      vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
      vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
      vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
      vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })

      -- Buffer navigation
      vim.keymap.set('n', '<S-l>', ':bnext<CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<S-h>', ':bprevious<CR>', { noremap = true, silent = true })

      -- Quick save
      vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true })
      vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true })
    end,
  }
}
