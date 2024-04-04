local set = vim.opt
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

--

-- Remap Esc
keymap.set("i", "<C-c>", "<Esc>")

-- Do things without affecting the registers
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')

vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Desativa a criação de arquivos de backup, arquivos de troca e writebackup
set.backup = false            -- Não criar arquivos de backup
set.writebackup = false       -- Não criar arquivos de backup ao escreverrr
set.swapfile = false          -- Não criar arquivos de troca

set.relativenumber = true     -- Exibe números relativos
set.autoindent = true         -- Habilita indentação automática baseada na linha anterior
set.clipboard = "unnamedplus" -- Permite acesso ao clipboard do sistema
set.expandtab = true          -- Converte tabs em espaços
set.mouse = "a"               -- Habilita suporte ao mouse em todos os modos
set.number = true             -- Exibe números das linhas
set.shiftwidth = 2            -- Define a quantidade de espaços para o recuo
set.softtabstop = 2           -- Define quantos espaços são considerados um 'tab'
set.tabstop = 2               -- Define quantos espaços reais um caractere de tabulação ocupa
vim.o.updatetime = 250        -- Reduz o tempo de espera para trigger 'CursorHold' e 'CursorHoldI'

-- Configurações da tecla líder
vim.g.mapleader = " "                                   -- Define a tecla líder para espaço
vim.g.maplocalleader = " "                              -- Define a tecla líder local para espaço

keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0 }) -- Mostra as informacões (tooltip) da variável ao apertar shift + k

-- Remapping Ctrl + d and Ctrl + u
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })

-- Remappin n and N
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', { noremap = true, silent = true })

-- Salvar e refazer
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-z>', ':redo<CR>', { noremap = true, silent = true })

-- Navegação entre buffers
keymap.set('n', 'g<Right>', ':bnext<CR>', opts)
keymap.set('n', 'g<Left>', ':bprevious<CR>', opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Resize window
keymap.set("n", "<leader>h", ":vertical resize -4<CR>", opts)

keymap.set("n", "<leader>l", ":vertical resize +4<CR>", opts)
keymap.set("n", "<leader>j", ":resize +4<CR>", opts)
keymap.set("n", "<leader>k", ":resize -4<CR>", opts)

-- Personalização do highlight para busca
vim.cmd [[highlight Search ctermfg=black ctermbg=yellow]]

-- File Explorer and Neotree
keymap.set('n', '<leader>e', ':Explore<CR>', opts)
keymap.set('n', '<C-b>', ':Neotree toggle<CR>', opts)
keymap.set('i', '<C-b>', '<Esc>:Neotree toggle<CR>', opts)

-- Mover linha atual para cima
keymap.set("n", "<S-Up>", ":m .-2<CR>==", opts)
keymap.set("i", "<S-Up>", "<Esc>:m .-2<CR>==gi", opts)
keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv", opts)

-- Mover linha atual para baixo
keymap.set("n", "<S-Down>", ":m .+1<CR>==", opts)
keymap.set("i", "<S-Down>", "<Esc>:m .+1<CR>==gi", opts)
keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv", opts)

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require('lazy').setup({
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      'neovim/nvim-lspconfig',             -- Required
      'williamboman/mason.nvim',           -- Optional
      'williamboman/mason-lspconfig.nvim', -- Optional
      -- Autocompletion
      'hrsh7th/nvim-cmp',                  -- Required
      ' rsh7th/cmp-nvim-lsp',              -- Required
      'L3MON4D3/LuaSnip',                  -- Required
    }
  },
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
  -- { "EdenEast/nightfox.nvim" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        -- flavour = "auto" -- will respect terminal's background
        background = {     -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true, -- disables setting the background color.
        show_end_of_buffer = false,    -- shows the '~' characters after the end of buffers
        term_colors = false,           -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false,             -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15,           -- percentage of the shade to apply to the inactive window
        },
        no_italic = false,             -- Force no italic
        no_bold = false,               -- Force no bold
        no_underline = false,          -- Force no underline
        styles = {                     -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" },     -- Change the style of comments
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
          -- miscs = {}, -- Uncomment to turn off hard-coded styles
        },
        color_overrides = {},
        custom_highlights = {},
        default_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
        },
      })
      vim.cmd.colorscheme "catppuccin"
    end
  },
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {

    }
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
  'nvim-lualine/lualine.nvim',
  'nvim-treesitter/nvim-treesitter',
  'mbbill/undotree',
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    cmd = 'Telescope',
    dependencies = { 'nvim-lua/plenary.nvim' },
    init = function()
      local builtin = require('telescope.builtin')
      keymap.set('n', '<leader>fg', builtin.git_files, {})
      keymap.set('n', '<leader>ff', builtin.find_files, {})
      keymap.set('n', '<leader>fb', builtin.buffers, {})
      keymap.set('n', '<leader>fh', builtin.help_tags, {})
      keymap.set('n', '<leader>fd', builtin.lsp_document_symbols, {})
      keymap.set('n', '<leader>fe', builtin.diagnostics, {})
      keymap.set('n', '<leader>fw', builtin.live_grep, {})
    end,
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('neo-tree').setup({
        default_component_configs = {
          git_status = {
            symbols = {
              added     = "✅",
              modified  = "🔥",
              deleted   = "D",
              renamed   = "R",
              untracked = "UN",
              ignored   = "I",
              unstaged  = "US",
              staged    = "S",
              conflict  = "C",
            },
          },
        }
      })
    end,
  },
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
    config = function()
      keymap.set('i', '<C-j>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
      keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end,
        { expr = true, silent = true })
      keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
        { expr = true, silent = true })
      keymap.set('i', '<c-g>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
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
        print("Trying to format", buf)
        if vim.g.formatting_disabled or vim.b[buf].formatting_disabled then
          print("Formatting disabled", buf)
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
      keymap.set("n", "zR", require("ufo").openAllFolds)
      keymap.set("n", "zM", require("ufo").closeAllFolds)
      keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
    end,
  },
  { 'mg979/vim-visual-multi' },
})

require('ufo').setup({
  provider_selector = function(bufnr, filetype, buftype)
    return { 'lsp', 'indent' }
  end
})

function ToggleCodeium()
  if vim.g.codeium_enabled == nil or vim.g.codeium_enabled then
    -- Desabilita o Codeium
    vim.g.codeium_enabled = false
    print("Codeium disabled")
  else
    -- Habilita o Codeium
    vim.g.codeium_enabled = true
    print("Codeium enabled")
  end
end

-- Mapeia o atalho F5 para alternar a ativação do Codeium
vim.api.nvim_set_keymap('n', '<F5>', ':lua ToggleCodeium()<CR>', { noremap = true, silent = true })

local lsp = require('lsp-zero').preset('recommended')

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
  lsp.async_autoformat(client, bufnr)

  keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
  keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)

  -- Habilita diagnósticos em linha
  vim.diagnostic.config({
    virtual_text = true,      -- Exibe texto virtual com os diagnósticos ao lado da linha
    signs = true,             -- Mostra ícones nos números de linha para indicar diagnósticos
    underline = true,         -- Sublinha o texto que tem diagnósticos
    update_in_insert = false, -- Evita atualizações de diagnóstico enquanto estiver no modo de inserção
    severity_sort = true,     -- Ordena diagnósticos por severidade
  })
end)

lsp.set_sign_icons({
  error = '✘',
  warn = ' ',
  hint = '⚑',
  info = '»',
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').lua_ls.setup({})


require('lspconfig').tsserver.setup({ capabilities = lsp_capabilities })

-- lsp setup for go

require('lspconfig').gopls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
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

lsp.setup()

local cmp = require('cmp')

cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }
})

-- nvim-treesitter setup
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'javascript', 'typescript', 'tsx', 'css', 'html',
    'c', 'cpp', 'python', 'lua', 'rust', 'go', 'haskell',
    'dockerfile', 'json', 'yaml', 'toml', 'bash', 'fish'
  },
  auto_update = true,
  incremental_selection = {
    enable = true,
  },
  highlight = {
    enable = true,
    disable = { "markdown" },
    -- When I add this enable = true the colors for GO works!
    --   -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    --   -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    --   -- Using this option may slow down your editor, and you may see some duplicate highlights.
    --   -- Instead of true it can also be a list of languages
    --   additional_vim_regex_highlighting = false,
  },
}
-- Trouble setup
keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)

-- lualine setup
require('lualine').setup {
  options = {
    theme = 'catppuccin',
    component_separators = '',
    section_separators = { left = '', right = '' },

  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename' },
    lualine_c = {
      { 'branch', icon = '' },
      {
        'diff',
        symbols = { added = ' ', modified = ' ', removed = ' ' },
      },
    },
    lualine_x = {
      {
        'diagnostics',
        symbols = {
          error = '🚩',
          warn = '🥶',
          hint = '⚑ ',
          info = '» ',
        },
      },
      {
        function()
          local msg = 'No Active LSP'
          local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
          local clients = vim.lsp.get_active_clients()
          if next(clients) == nil then
            return msg
          end
          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              return client.name
            end
          end
          return msg
        end,
        icon = '',
      },
    },
    lualine_y = { 'filetype' },
    lualine_z = {
      { 'progress', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}

-- gitsigns setup
local git_char = '┃' --'│'
require('gitsigns').setup {
  signs = {
    add = { text = git_char },
    change = { text = git_char },
    delete = { text = git_char },
    topdelete = { text = git_char },
    changedelete = { text = git_char },
    untracked = { text = git_char },
  },
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d %H:%M> - <summary>',
  signcolumn = true,
  numhl = false,
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end
    map('n', '<leader>xr', gs.reset_hunk)
    map('n', '<leader>xp', gs.preview_hunk)
    map('n', '<leader>xb', function() gs.blame_line { full = true } end) -- open a window with the full blame
    map('n', '<leader>xd', gs.diffthis)
    map('n', '<leader>xn', gs.next_hunk)
  end
}

-- UndoTree configuration
keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
