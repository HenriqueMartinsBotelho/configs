-- Lazy.nvim setup
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    'j-hui/fidget.nvim',
    tag = 'legacy',
    event = 'LspAttach',
    opts = {
      text = {
        spinner = 'dots',
        done = '✓',
      }
    },
  },
  {

    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- require("onenord").setup({
      -- 	theme = "dark", -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
      -- 	borders = true, -- Split window borders
      -- 	fade_nc = false, -- Fade non-current windows, making them more distinguishable
      -- 	-- Style that is applied to various groups: see `highlight-args` for options
      -- 	styles = {
      -- 		comments = "italic",
      -- 		strings = "italic",
      -- 		keywords = "italic",
      -- 		functions = "NONE",
      -- 		variables = "NONE",
      -- 		diagnostics = "underline",
      -- 	},
      -- 	disable = {
      -- 		background = false, -- Disable setting the background color
      -- 		float_background = true, -- Disable setting the background color for floating windows
      -- 		cursorline = false, -- Disable the cursorline
      -- 		eob_lines = true, -- Hide the end-of-buffer lines
      -- 	},
      -- 	-- Inverse highlight for different groups
      -- 	inverse = {
      -- 		match_paren = false,
      -- 	},
      -- 	custom_highlights = {}, -- Overwrite default highlight groups
      -- 	custom_colors = {}, -- Overwrite default colors
      -- })
      -- vim.cmd("colorscheme onenord")
      local lackluster = require("lackluster")
      local color = lackluster.color -- blue, green, red, orange, black, lack, luster, gray1-9
      -- setup before set colorscheme
      lackluster.setup({
        -- You can overwrite the following syntax colors by setting them to one of...
        --   1) a hexcode like "#a1b2c3" for a custom color
        --   2) "default" or nil will just use whatever lackluster's default is.
        tweak_syntax = {
          string = "default",
          -- string = "#a1b2c3", -- custom hexcode
          -- string = color.green, -- lackluster color
          string_escape = "default",
          comment = "default",
          builtin = "default", -- builtin modules and functions
          type = "default",
          keyword = "default",
          keyword_return = "default",
          keyword_exception = "default",
        },
        -- You can overwrite the following background colors by setting them to one of...
        --   1) a hexcode like "#a1b2c3" for a custom color
        --   2) "none" for transparency
        --   3) "default" or nil will just use whatever lackluster's default is.
        tweak_background = {
          -- normal = "default", -- main background
          normal = "none", -- transparent
          -- normal = '#a1b2c3',    -- hexcode
          -- normal = color.green,    -- lackluster color
          telescope = "none", -- telescope
          menu = "default", -- nvim_cmp, wildmenu ... (bad idea to transparent)
          popup = "default", -- lazy, mason, whichkey ... (bad idea to transparent)
        },
      })
      vim.cmd.colorscheme("lackluster-mint")
    end,
  },
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {}
  },
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      highlight = {
        pattern = [[.*<(KEYWORDS)\s*(\(\@?\w*\))?\s*:?]],
      },
    },
  },
  {
    'terrortylor/nvim-comment',
    init = function()
      require('nvim_comment').setup()
    end,
  },
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'lewis6991/gitsigns.nvim',
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          theme = 'lackluster'
        }
      }
    end,
  },
  'nvim-treesitter/nvim-treesitter',
  'mbbill/undotree',
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    cmd = 'Telescope',
    dependencies = { 'nvim-lua/plenary.nvim' },
    init = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>fd', builtin.lsp_document_symbols, {})
      vim.keymap.set('n', '<leader>fe', builtin.diagnostics, {})
      vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        sort = {
          sorter = "case_sensitive",
        },
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
      })
    end
  },
  {
    'stevearc/conform.nvim',
    event = 'BufReadPre',
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'prettier' },
        markdown = { 'prettier' },
        go = { 'goimports', 'gofumpt' },
        pgsql = { 'sql_formatter' },
        sql = { 'sql_formatter' },
        typescript = { 'prettier' },
        typescriptreact = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
      },
      format_on_save = function(buf)
        if vim.g.formatting_disabled or vim.b[buf].formatting_disabled then
          return
        end
        return { timeout_ms = 500, lsp_fallback = true }
      end,
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    config = function()
      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
      vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
    end,
  },
  { 'mg979/vim-visual-multi' },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        dependencies = "copilot.lua",
        opts = {},
        config = function(_, opts)
          local copilot_cmp = require("copilot_cmp")
          copilot_cmp.setup(opts)
        end,
      },
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
    },
    opts = function(_, opts)
      if not opts.sources then
        opts.sources = {}
      end
      table.insert(opts.sources, 1, { name = "copilot", group_index = 1, priority = 100 })
      table.insert(opts.sources, { name = 'nvim_lsp' })
      table.insert(opts.sources, { name = 'buffer' })
      table.insert(opts.sources, { name = 'path' })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')

      -- LSP server configurations
      lspconfig.lua_ls.setup({
        on_attach = function(client, bufnr)
          local buf_map = function(bufnr, mode, lhs, rhs, opts)
            vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or { silent = true })
          end

          buf_map(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
          buf_map(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')

          vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
          })
        end,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      })

      lspconfig.tsserver.setup({
        on_attach = function(client, bufnr)
          local buf_map = function(bufnr, mode, lhs, rhs, opts)
            vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or { silent = true })
          end

          buf_map(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
          buf_map(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')

          vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
          })
        end,
      })

      lspconfig.gopls.setup({
        on_attach = function(client, bufnr)
          local buf_map = function(bufnr, mode, lhs, rhs, opts)
            vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or { silent = true })
          end

          buf_map(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
          buf_map(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')

          vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
          })
        end,
        settings = {
          gopls = {
            analyses = {
              assign = true,
              atomic = true,
              bools = true,
              composites = true,
              copylocks = true,
              deepequalerrors = true,
              embed = true,
              errorsas = true,
              fieldalignment = true,
              httpresponse = true,
              ifaceassert = true,
              loopclosure = true,
              lostcancel = true,
              nilfunc = true,
              nilness = true,
              nonewvars = true,
              printf = true,
              shadow = true,
              shift = true,
              simplifycompositelit = true,
              simplifyrange = true,
              simplifyslice = true,
              sortslice = true,
              stdmethods = true,
              stringintconv = true,
              structtag = true,
              testinggoroutine = true,
              tests = true,
              timeformat = true,
              unmarshal = true,
              unreachable = true,
              unsafeptr = true,
              unusedparams = true,
              unusedresult = true,
              unusedvariable = true,
              unusedwrite = true,
              useany = true,
            },
            hoverKind = "FullDocumentation",
            linkTarget = "pkg.go.dev",
            usePlaceholders = true,
            vulncheck = "Imports",
          },
        },
      })
    end,
  },
})

require('ufo').setup({
  provider_selector = function(bufnr, filetype, buftype)
    return { 'lsp', 'indent' }
  end
})

local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
  },
  sources = cmp.config.sources({
    { name = 'copilot', priority = 100 },
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    { name = 'buffer' },
    { name = 'path' },
  }),
})
