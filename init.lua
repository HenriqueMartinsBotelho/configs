-- Todo: Adicionar comentários explicando o que cada configuração faz
-- autocomplete js, ts, go
-- mostrar tipagem de variáveis ao passsar mouse
-- fazer lista de atalhos

local set = vim.opt
set.autoindent = true          -- Habilita indentação automática baseada na linha anterior
set.clipboard = "unnamedplus"  -- Permite acesso ao clipboard do sistema
set.expandtab = true           -- Converte tabs em espaços
set.mouse = "a"                -- Habilita suporte ao mouse em todos os modos
set.number = true              -- Exibe números das linhas
set.shiftwidth = 2             -- Define a quantidade de espaços para o recuo
set.softtabstop = 2            -- Define quantos espaços são considerados um 'tab'
set.tabstop = 2                -- Define quantos espaços reais um caractere de tabulação ocupa

vim.o.updatetime = 250         -- Reduz o tempo de espera para trigger 'CursorHold' e 'CursorHoldI'

-- Configurações da tecla líder
vim.g.mapleader = " "          -- Define a tecla líder para espaço
vim.g.maplocalleader = " "     -- Define a tecla líder local para espaço

-- lazy.nvim installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)




-- Plugins



require("lazy").setup({
  -- Configuração para `vim-moonfly-colors`
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000
  },

  -- Configuração para nvim-tree

  {
    "kyazdani42/nvim-tree.lua",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require'nvim-tree'.setup {}
    end
  },

  -- Configuração para `mason.nvim`
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ensure_installed = {
          "stylua",
          "selene",
          "luacheck",
          "shellcheck",
          "shfmt",
          "tailwindcss-language-server",
          "typescript-language-server",
          "css-lsp",
        },
      })
    end,
  },
  -- Configuração para `nvim-lspconfig`
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      
      lspconfig.tsserver.setup({
        root_dir = lspconfig.util.root_pattern(".git"),
        single_file_support = false,
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "literal",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = false,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
      })
    end,
  },
  -- Configuração para `nvim-treesitter` e `nvim-treesitter/playground`
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "cmake",
          "cpp",
          "css",
          "gitignore",
          "go",
          "graphql",
          "http",
          "scss",
          "sql",
        },
        query_linter = {
          enable = true,
          use_virtual_text = true,
          lint_events = { "BufWrite", "CursorHold" },
        },
        playground = {
          enable = true,
          persist_queries = true, -- Whether the query persists across vim sessions
          keybindings = {
            toggle_query_editor = "o",
            toggle_hl_groups = "i",
            toggle_injected_languages = "t",
            toggle_anonymous_nodes = "a",
            toggle_language_display = "I",
            focus_language = "f",
            unfocus_language = "F",
            update = "R",
            goto_node = "<cr>",
            show_help = "?",
          },
        },
      })

      -- MDX support
      vim.filetype.add({
        extension = {
          mdx = "markdown",
        },
      })
    end,
  },
  {
    "nvim-treesitter/playground",
    cmd = "TSPlaygroundToggle"
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {'williamboman/mason.nvim'},           -- Optional
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},         -- Required
        {'hrsh7th/cmp-nvim-lsp'},     -- Required
        {'hrsh7th/cmp-buffer'},       -- Optional
        {'hrsh7th/cmp-path'},         -- Optional
        {'saadparwaiz1/cmp_luasnip'}, -- Optional
        {'hrsh7th/cmp-nvim-lua'},     -- Optional

        -- Snippets
        {'L3MON4D3/LuaSnip'},             -- Required
        {'rafamadriz/friendly-snippets'}, -- Optional
    }
  },   
})



-- Set colorscheme
vim.cmd.colorscheme("moonfly")

-- Keymaps
vim.keymap.set("n", "<leader>n", ":bn<cr>", { silent = true })
vim.keymap.set("n", "<leader>p", ":bp<cr>", { silent = true })
vim.keymap.set("n", "<leader>d", ":bd<cr>", { silent = true })
vim.keymap.set("n", "<leader>s", ":wa<cr>", { silent = true })
vim.keymap.set("n", "<leader>e", ":E<cr>", { silent = true })

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})


-- Keymaps nvim-tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>r", ":NvimTreeRefresh<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>n", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })


-- LSP configuration
-- vim.diagnostic.config({
--   virtual_text = false -- Desabilita a exibição de mensagens de erro no texto
-- })


vim.api.nvim_create_autocmd({ "CursorHold" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
  callback = function ()
    vim.diagnostic.open_float(nil, { focus = false })
  end
})


-- Adicionando autocomando para autoformatação ao salvar arquivos TypeScript e Go
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.ts", "*.tsx", "*.go" },
    callback = function()
      -- Verifica a existência da função 'format', que é a forma atualizada.
      if vim.lsp.buf.format then
        vim.lsp.buf.format({ timeout_ms = 1000 })
      elseif vim.lsp.buf.formatting_sync then
        -- Fallback para versões mais antigas que ainda utilizam 'formatting_sync'
        vim.lsp.buf.formatting_sync(nil, 1000)
      end
    end,
  })
  