return {
  'HiPhish/debugpy.nvim',
  dependencies = { 'mfussenegger/nvim-dap' },
  cmd = 'Debugpy',
  ft = 'python',
  config = function()
    local dap = require 'dap'

    local function venv_python()
      local from = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
      -- Prefer the workspace root (uv.lock/.git) over a member pyproject.toml
      local found = vim.fs.find({ 'uv.lock', '.git' }, { upward = true, path = from })[1]
        or vim.fs.find({ 'pyproject.toml', '.venv', 'venv' }, { upward = true, path = from })[1]
      local root = found and vim.fs.dirname(found)
      if not root then return 'python' end

      local venv = (vim.uv.fs_stat(root .. '/.venv') and root .. '/.venv')
        or (vim.uv.fs_stat(root .. '/venv') and root .. '/venv')
      if not venv then return 'python' end

      return vim.fn.has 'win32' == 1 and venv .. '/Scripts/python.exe' or venv .. '/bin/python'
    end

    dap.adapters.debugpy_executable = function(cb, _)
      cb {
        type = 'executable',
        command = venv_python(),
        args = { '-m', 'debugpy.adapter' },
      }
    end

    dap.defaults.fallback.exception_breakpoints = { 'uncaught', 'userUnhandled' }
  end,
}
