-- Todo: Adicionar comentários explicando o que cada configuração faz
-- adicionar os plugins do devaslife

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

vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer = 0}) -- Mostra as informacões (tooltip) da variável ao apertar shift + k 


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
			'neovim/nvim-lspconfig',    -- Required
			'williamboman/mason.nvim',  -- Optional
			'williamboman/mason-lspconfig.nvim', -- Optional
			-- Autocompletion
			'hrsh7th/nvim-cmp',         -- Required
			'hrsh7th/cmp-nvim-lsp',     -- Required
			'L3MON4D3/LuaSnip',         -- Required
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
	-- {
	-- 	'ellisonleao/gruvbox.nvim',
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd('colorscheme gruvbox')
	-- 	end
	-- },
	{
		'folke/tokyonight.nvim',
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd('colorscheme tokyonight-night')
			vim.cmd('hi MsgArea guibg=#15161e')
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
		'nvimdev/indentmini.nvim',
		event = 'BufEnter',
		config = function()
			require('indentmini').setup({
				--char = '',
				--char = '┊',
				char = '│',
			})
			vim.cmd.highlight('default link IndentLine Comment')
		end,
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
	'theprimeagen/harpoon',
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.2',
		cmd = 'Telescope',
		dependencies = { 'nvim-lua/plenary.nvim' },
		init = function()
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<C-p>', builtin.git_files, {})
			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
			vim.keymap.set('n', '<leader>fd', builtin.lsp_document_symbols, {})
			vim.keymap.set('n', '<leader>fw', builtin.lsp_workspace_symbols, {})
			vim.keymap.set('n', '<leader>fe', builtin.diagnostics, {})
		end,
	},
	{
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v3.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons',
			'MunifTanjim/nui.nvim',
		}
	},
	
})

local lsp = require('lsp-zero').preset('recommended')

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
	lsp.async_autoformat(client, bufnr)

	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)

 -- Habilita diagnósticos em linha
    vim.diagnostic.config({
        virtual_text = true,  -- Exibe texto virtual com os diagnósticos ao lado da linha
        signs = true,         -- Mostra ícones nos números de linha para indicar diagnósticos
        underline = true,     -- Sublinha o texto que tem diagnósticos
        update_in_insert = false, -- Evita atualizações de diagnóstico enquanto estiver no modo de inserção
        severity_sort = true, -- Ordena diagnósticos por severidade
    })

end)

lsp.set_sign_icons({
	error = '✘',
	warn = '',
	hint = '⚑',
	info = '»',
})

require('lspconfig').lua_ls.setup({})

lsp.setup()

local cmp = require('cmp')

cmp.setup({
	mapping = {
		['<CR>'] = cmp.mapping.confirm({ select = false }),
	}
})

vim.keymap.set('n', '<leader>gs', vim.cmd.Git)



vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

require('nvim-treesitter.configs').setup {
	ensure_installed = {
		'javascript', 'typescript', 'css', 'html',
		'c', 'cpp', 'python', 'lua', 'rust', 'go', 'haskell',
		'dockerfile', 'json', 'yaml', 'toml', 'bash', 'fish',
	},
	auto_update = true,
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = '<C-space>',
			node_incremental = '<C-space>',
			node_decremental = '<C-backspace>',
		},
	},
}

local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>a', mark.add_file)
vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)
vim.keymap.set('n', '<C-h>', function() ui.nav_file(1) end)
vim.keymap.set('n', '<C-t>', function() ui.nav_file(2) end)
vim.keymap.set('n', '<C-n>', function() ui.nav_file(3) end)
vim.keymap.set('n', '<C-s>', function() ui.nav_file(4) end)



vim.keymap.set('n', '<leader>n', ':Neotree reveal toggle<CR>', {noremap = true, silent = true})



vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)


-- lualine setup
require('lualine').setup {
	options = {
		theme = 'tokyonight',
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
					error = '✘ ',
					warn = ' ',
					hint = '⚑ ',
					info = '» ',
				},
			},
			{
				function()
					local msg = ''
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
			{ 'location', separator = { right = '' }, left_padding = 2 },
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
	signcolumn = true,
	numhl = false,
}