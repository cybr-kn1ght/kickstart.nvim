return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = 'BufReadPre', -- lazy-load on file read, not VimEnter
    opts = {},
    config = function(_, opts)
      local ibl = require 'ibl'
      ibl.setup(opts)

      -- Only attach ibl to buffers that are NOT dashboard
      vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile' }, {
        callback = function(args)
          local ft = vim.api.nvim_buf_get_option(args.buf, 'filetype')
          if ft ~= 'dashboard' then ibl.attach(args.buf) end
        end,
      })
    end,
  },
}
