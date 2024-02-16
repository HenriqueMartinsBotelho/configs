-- Todo: Adicionar comentários explicando o que cada configuração faz
-- autocomplete js, ts, go
-- mostrar tipagem de variáveis ao passsar mouse
-- fazer lista de atalhos

local set = vim.opt
set.autoindent = true
set.clipboard = "unnamedplus"
set.expandtab = true
set.mouse = "a"
set.number = true
set.shiftwidth = 2
set.softtabstop = 2
set.tabstop = 2

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

-- Plugin installation
require("lazy").setup({
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",
      "jose-elias-alvarez/null-ls.nvim" -- Adicionando null-ls para autoformatação
    }
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip"
    }
  },
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000
  },
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require'nvim-tree'.setup {}
    end
  },
  -- Adicionando typescript.nvim para melhor suporte ao TypeScript
  {
    "jose-elias-alvarez/typescript.nvim",
    config = function()
      require("typescript").setup({
        disable_commands = false,
        debug = false,
        go_to_source_definition = {
          fallback = true,
        },
      })
    end
  },
  -- Plugin para autopairs, melhora a experiência de codificação em React/JSX
  "windwp/nvim-autopairs",
  -- Adicionando null-ls para autoformatação
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("null-ls").setup({
        sources = {
          require("null-ls").builtins.formatting.prettier.with({
            filetypes = { "typescript", "typescriptreact" },
          }),
          require("null-ls").builtins.formatting.gofmt,
        },
      })
    end
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

vim.keymap.set({ "i", "s" }, "<Tab>", function()
  if vim.fn["vsnip#jumpable"](1) == 1 then
    return "<Plug>(vsnip-jump-next)"
  else
    return "<Tab>"
  end
end, { expr = true, remap = true })

vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
  if vim.fn["vsnip#jumpable"](-1) == 1 then
    return "<Plug>(vsnip-jump-prev)"
  else
    return "<S-Tab>"
  end
end, { expr = true, remap = true })

-- Keymaps nvim-tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>r", ":NvimTreeRefresh<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>n", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })

-- Completion configuration
local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true })
  }),
  sources = cmp.config.sources(
    {
      { name = "nvim_lsp" },
      { name = "vsnip" }
    },
    {
      { name = "path" }
    },
    {
      { name = "buffer" }
    }
  )
})

-- LSP configuration
vim.diagnostic.config({
  virtual_text = false
})

vim.o.updatetime = 250

vim.api.nvim_create_autocmd({ "CursorHold" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
  callback = function ()
    vim.diagnostic.open_float(nil, { focus = false })
  end
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers {
  function(server_name)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities
    }
  end
}

-- Autopairs configuração
require('nvim-autopairs').setup({})

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
  