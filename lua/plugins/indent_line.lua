return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      indent = { char = '│' }, -- choose a char you like
      whitespace = { remove_blankline_trail = false }, -- show guides through blank lines
      exclude = {
        filetypes = {
          'dashboard',
          'help',
          'lazy',
          'mason',
          'lspinfo',
          'TelescopePrompt',
          'TelescopeResults',
          'terminal',
        },
      },
      scope = { enabled = true },
    },
  },
}
