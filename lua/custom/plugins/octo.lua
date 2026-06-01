return {
  'pwntester/octo.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  cmd = 'Octo',
  keys = {
    { '<leader>gp', '<cmd>Octo pr list<cr>',     desc = '[G]itHub [P]Rs' },
    { '<leader>gi', '<cmd>Octo issue list<cr>',  desc = '[G]itHub [I]ssues' },
    { '<leader>gr', '<cmd>Octo review start<cr>', desc = '[G]itHub [R]eview' },
  },
  opts = {
    picker = 'telescope',
  },
}
