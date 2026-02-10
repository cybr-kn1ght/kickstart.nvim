return {
  {
    'NeogitOrg/neogit',
    lazy = true,
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration

      -- Only one of these is needed.
      'nvim-telescope/telescope.nvim', -- optional
      -- 'ibhagwan/fzf-lua', -- optional
      -- 'nvim-mini/mini.pick', -- optional
      -- 'folke/snacks.nvim', -- optional
    },
    cmd = 'Neogit',
    keys = {
      { '<leader>gg', '<cmd>Neogit<cr>', desc = 'Show Neogit UI' },
    },
    config = function()
      require('neogit').setup {
        kind = 'floating',
        integrations = {
          diffview = true,
        },
      }

      -- Close Diffview with `q`
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'DiffviewFiles', 'DiffviewFileHistory' },
        callback = function(ev) vim.keymap.set('n', 'q', '<cmd>DiffviewClose<CR>', { buffer = ev.buf, silent = true }) end,
      })
    end,
  },
}
