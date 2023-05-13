local map = vim.api.nvim_set_keymap
local options = { noremap = true }

map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', options)
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', options)
-- map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', options)
-- map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', options)
-- map('n', '<leader>gf', '<cmd>Telescope git_files<cr>', options)
-- map('n', '<leader>gg', '<cmd>Telescope git_grep<cr>', options)



-- set("n", ";", ":", { noremap = true })  -- Mapeia ';' para ':' no modo normal
-- set("n", "<Leader>r", ":luafile %<CR>", ns)  -- Mapeia 'leader+r' para recarregar o arquivo atual no modo normal

-- set("t", "<Esc>", "<C-\\><C-n><C-w><C-w>", ns)  -- Mapeia 'Esc' para sair do modo terminal e voltar para o modo normal


-- set("n", "<C-j>", ":resize -2<CR>", ns)  -- Mapeia 'Ctrl+j' para diminuir a altura da janela no modo normal
-- set("n", "<C-k>", ":resize +2<CR>", ns)  -- Mapeia 'Ctrl+k' para aumentar a altura da janela no modo normal
-- set("n", "<C-h>", ":vertical resize +2<CR>", ns)  -- Mapeia 'Ctrl+h' para aumentar a largura da janela no modo normal
-- set("n", "<C-l>", ":vertical resize -2<CR>", ns)  -- Mapeia 'Ctrl+l' para diminuir a largura da janela no modo normal
-- set("n", "<Leader>h", ":<C-u>split<CR>", ns)  -- Mapeia 'leader+h' para dividir a janela horizontalmente no modo normal
-- set("n", "<Leader>v", ":<C-u>vsplit<CR>", ns)  -- Mapeia 'leader+v' para dividir a janela verticalmente no modo normal

-- set("n", "j", "gj", ns)  -- Mapeia 'j' para 'gj' no modo normal
-- set("n", "k", "gk", ns)  -- Mapeia 'k' para 'gk' no modo normal

-- set("n", "<Tab>", ":BufferLineCycleNext<CR>", ns)  -- Mapeia 'Tab' para ir para o próximo buffer no modo normal
-- set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", ns)  -- Mapeia 'Shift+Tab' para ir para o buffer anterior no modo normal
-- set("n", "<C-d>", ":bd<CR>", ns)  -- Mapeia 'Ctrl+d' para deletar o buffer atual no modo normal
-- set("n", "<C-t>", ":tabnew <CR>", ns)  -- Mapeia 'Ctrl+t' para abrir uma nova aba no modo normal

-- set("n", "<C-n>", ":NvimTreeToggle<CR>", ns)  -- Mapeia 'Ctrl+n' para alternar a visibilidade do NvimTree no modo normal
-- set("n", "<Leader>n", ":NvimTreeFindFile<CR>", ns)  -- Mapeia 'leader+n' para encontrar o arquivo atual no NvimTree no modo normal


-- set("n", "<Leader>cc", ":Commentary<CR>", ns)  -- Mapeia 'leader+cc' para comentar a linha atual no modo normal
-- set("v", "<Leader>cc", ":Commentary<CR>", ns)  -- Mapeia 'leader+cc' para comentar a seleção no modo visual

-- set("n", "<Leader>(", "viw<ESC>a)<esc>bi(<esc>ela", ns)  -- Mapeia 'leader+(' para adicionar parênteses em torno da palavra sob o cursor no modo normal
-- set("n", "<Leader>[", "viw<ESC>a]<esc>bi[<esc>ela", ns)  -- Mapeia 'leader+[' para adicionar colchetes em torno da palavra sob o cursor no modo normal
-- set("n", "<Leader>{", "viw<ESC>a}<esc>bi{<esc>ela", ns)  -- Mapeia 'leader+{' para adicionar chaves em torno da palavra sob o cursor no modo normal
-- set("n", "<Leader><", "viw<ESC>a><esc>bi<<esc>ela", ns)  -- Mapeia 'leader+<' para adicionar sinais de menor em torno da palavra sob o cursor no modo normal

