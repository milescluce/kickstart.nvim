return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  lazy = false,  -- load at startup so the VimEnter autocmd registers in time
  keys = {
    { '\\', '<cmd>Neotree reveal<cr>', desc = 'NeoTree reveal' },
  },
  opts = {
    filesystem = {
      hijack_netrw_behavior = 'open_current',
      window = {
        mappings = { ['\\'] = 'close_window' },
      },
    },
  },
  config = function(_, opts)
    require('neo-tree').setup(opts)

    vim.api.nvim_create_autocmd('VimEnter', {
      desc = 'Open Neo-tree on startup',
      callback = function()
        local argv = vim.fn.argv()
        local first = argv[1]
        if first and vim.fn.isdirectory(first) == 1 then
          vim.cmd('Neotree current dir=' .. vim.fn.fnameescape(first))
        elseif #argv == 0 then
          vim.cmd('Neotree show')
        end
      end,
    })
  end,
}
