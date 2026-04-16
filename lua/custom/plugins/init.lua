return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    config = function()
      -- Setup notify first
      local notify = require 'notify'
      notify.setup {
        stages = 'fade_in_slide_out',
        timeout = 1000,
        background_colour = '#000000',
        render = 'default',
        top_down = false,
        merge_duplicates = true,
      }

      vim.notify = notify

      require('noice').setup {
        views = {
          cmdline_popup = {
            position = {
              row = 5,
              col = '50%',
            },
            size = {
              width = 60,
              height = 'auto',
            },
          },
          popupmenu = {
            relative = 'editor',
            position = {
              row = 8,
              col = '50%',
            },
            size = {
              width = 60,
              height = 10,
            },
            border = {
              style = 'rounded',
              padding = { 0, 1 },
            },
            win_options = {
              winhighlight = { Normal = 'Normal', FloatBorder = 'DiagnosticInfo' },
            },
          },
        },
      }
    end,
  },

  {
    'numToStr/Comment.nvim',
    opts = {},
  },

  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
      'TmuxNavigatorProcessList',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },

  {
    'tzachar/highlight-undo.nvim',
    opts = {
      hlgroup = 'HighlightUndo',
      duration = 300,
      pattern = { '*' },
      ignored_filetypes = { 'neo-tree', 'fugitive', 'TelescopePrompt', 'mason', 'lazy' },
      -- ignore_cb is in comma as there is a default implementation. Setting
      -- to nil will mean no default os called.
      -- ignore_cb = nil,
    },
  },

  {
    'luukvbaal/statuscol.nvim',
    config = function()
      -- local builtin = require("statuscol.builtin")
      require('statuscol').setup {
        -- configuration goes here, for example:
        -- relculright = true,
        -- segments = {
        --   { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
        --   {
        --     sign = { namespace = { "diagnostic/signs" }, maxwidth = 2, auto = true },
        --     click = "v:lua.ScSa"
        --   },
        --   { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
        --   {
        --     sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = true },
        --     click = "v:lua.ScSa"
        --   },
        -- }
      }
    end,
  },

  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    config = function()
      require('nightfox').setup {
        palettes = {
          carbonfox = {
            green = '#c0e89f',
          },
        },
        specs = {
          carbonfox = {
            syntax = {
              string = 'green', -- Maps strings to the green defined above
            },
          },
        },
      }

      vim.cmd 'colorscheme carbonfox'
    end,
  },
}
