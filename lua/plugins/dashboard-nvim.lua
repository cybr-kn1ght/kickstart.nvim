return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local db = require 'dashboard'

      local large_header = {
        '    ',
        '    ',
        '    ',
        '    ',
        '=================     ===============     ===============   ========  ========',
        '\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //',
        '||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .||',
        '|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||',
        '||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||',
        '|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . ||',
        "||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\\_ . .|. .||",
        '|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ `-_/| . ||',
        "||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \\  / |-_.||",
        "||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \\  / |  `||",
        "||    `'         || ||         `'    || ||    `'         || ||   | \\  / |   ||",
        "||            .===' `===.         .==='.`===.         .===' /==. |  \\/  |   ||",
        "||         .=='   \\_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \\/  |   ||",
        "||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \\/  |   ||",
        "||   .=='    _-'          '-__\\._-'         '-_./__-'         `' |. /|  |   ||",
        "||.=='    _-'                                                     `' |  /==.||",
        "=='    _-'                                                            \\/   `==",
        "\\   _-'                                                                `-_   /",
        " `''                                                                      ``' ",
        '  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓ ',
        '  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ',
        ' ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░ ',
        ' ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██  ',
        ' ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒ ',
        ' ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░ ',
        ' ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░ ',
        '    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░    ',
        '          ░    ░  ░    ░ ░        ░   ░         ░    ',
        '                                 ░                   ',
        '    ',
        '    ',
      }

      local small_header = {
        '    ',
        '    ',
        '  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓ ',
        '  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ',
        ' ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░ ',
        ' ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██  ',
        ' ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒ ',
        ' ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░ ',
        ' ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░ ',
        '    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░    ',
        '          ░    ░  ░    ░ ░        ░   ░         ░    ',
        '                                 ░                   ',
        '    ',
      }

      local function get_header()
        local h = vim.o.lines

        local out = { '    ', '    ' }

        local header = h < 55 and small_header or large_header
        for _, line in ipairs(header) do
          table.insert(out, line)
        end

        table.insert(out, '    ')
        if h >= 55 then table.insert(out, '    ') end

        return out
      end

      db.setup {
        theme = 'doom',
        hide = {
          statusline = false,
        },
        config = {
          vertical_centre = true,
          header = get_header(),

          center = {
            { icon = '+ ', desc = 'New File', key = 'n', action = 'enew' },
            { icon = '> ', desc = 'Find File', key = 'f', action = 'Telescope find_files' },
            { icon = '> ', desc = 'Recent Files', key = 'r', action = 'Telescope oldfiles' },
            { icon = '* ', desc = 'Find Word', key = 'g', action = 'Telescope live_grep' },
            { icon = 'x ', desc = 'Quit', key = 'q', action = 'qa' },
          },

          footer = {
            '    ',
            'Rip and tear.',
          },
        },
      }

      vim.api.nvim_create_autocmd('VimResized', {
        callback = function()
          db.setup {
            theme = 'doom',
            config = {
              header = get_header(),
            },
          }
        end,
      })

      vim.keymap.set('n', '<leader>d', '<cmd>Dashboard<CR>', { desc = 'Go to [D]ashboard' })
    end,
  },
}
