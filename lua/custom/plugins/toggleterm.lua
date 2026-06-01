return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup({
      size = 60,
      open_mapping = [[<leader>tt]],
      direction = 'vertical',
      shell = 'powershell',
    })
    local Terminal = require('toggleterm.terminal').Terminal
    local term = Terminal:new({ direction = 'vertical' })
    vim.keymap.set('n', '<C-\\>', function() term:toggle() end, { desc = 'Toggle terminal' })
    vim.keymap.set('t', '<C-\\>', function() term:toggle() end, { desc = 'Toggle terminal' })
  end,
}
