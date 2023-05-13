local set = vim.api.nvim_set_keymap  -- Define set como um atalho para vim.api.nvim_set_keymap
local ns = { noremap = true, silent = true }  -- Cria uma tabela que define mapeamentos não recursivos e silenciosos
local cmd = vim.cmd  -- Define cmd como um atalho para vim.cmd

set("n", ";", ":", { noremap = true })  -- Mapeia ';' para ':' no modo normal
set("n", "<Leader>r", ":luafile %<CR>", ns)  -- Mapeia 'leader+r' para recarregar o arquivo atual no modo normal

set("t", "<Esc>", "<C-\\><C-n><C-w><C-w>", ns)  -- Mapeia 'Esc' para sair do modo terminal e voltar para o modo normal

set("n", "<Leader><Space>", ":let @/=''<CR>", ns)  -- Mapeia 'leader+espaço' para limpar a pesquisa no modo normal
set("n", "<Leader>ff", ":Telescope find_files<CR>", ns)  -- Mapeia 'leader+ff' para encontrar arquivos com o Telescope no modo normal

set("n", "<C-j>", ":resize -2<CR>", ns)  -- Mapeia 'Ctrl+j' para diminuir a altura da janela no modo normal
set("n", "<C-k>", ":resize +2<CR>", ns)  -- Mapeia 'Ctrl+k' para aumentar a altura da janela no modo normal
set("n", "<C-h>", ":vertical resize +2<CR>", ns)  -- Mapeia 'Ctrl+h' para aumentar a largura da janela no modo normal
set("n", "<C-l>", ":vertical resize -2<CR>", ns)  -- Mapeia 'Ctrl+l' para diminuir a largura da janela no modo normal
set("n", "<Leader>h", ":<C-u>split<CR>", ns)  -- Mapeia 'leader+h' para dividir a janela horizontalmente no modo normal
set("n", "<Leader>v", ":<C-u>vsplit<CR>", ns)  -- Mapeia 'leader+v' para dividir a janela verticalmente no modo normal

set("n", "j", "gj", ns)  -- Mapeia 'j' para 'gj' no modo normal
set("n", "k", "gk", ns)  -- Mapeia 'k' para 'gk' no modo normal

set("n", "<Tab>", ":BufferLineCycleNext<CR>", ns)  -- Mapeia 'Tab' para ir para o próximo buffer no modo normal
set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", ns)  -- Mapeia 'Shift+Tab' para ir para o buffer anterior no modo normal
set("n", "<C-d>", ":bd<CR>", ns)  -- Mapeia 'Ctrl+d' para deletar o buffer atual no modo normal
set("n", "<C-t>", ":tabnew <CR>", ns)  -- Mapeia 'Ctrl+t' para abrir uma nova aba no modo normal

set("n", "<C-n>", ":NvimTreeToggle<CR>", ns)  -- Mapeia 'Ctrl+n' para alternar a visibilidade do NvimTree no modo normal
set("n", "<Leader>n", ":NvimTreeFindFile<CR>", ns)  -- Mapeia 'leader+n' para encontrar o arquivo atual no NvimTree no modo normal

set("n", "<Leader><Leader>", ":Telescope find_files<CR>", ns)  -- Mapeia 'leader+leader' para encontrar arquivos com o Telescope no modo normal
set("n", "<C-p>", ":Telescope buffers<CR>", ns)  -- Mapeia 'Ctrl+p' para listar os buffers com o Telescope no modo normal

set("n", "<Leader>cc", ":Commentary<CR>", ns)  -- Mapeia 'leader+cc' para comentar a linha atual no modo normal
set("v", "<Leader>cc", ":Commentary<CR>", ns)  -- Mapeia 'leader+cc' para comentar a seleção no modo visual

set("n", '<Leader>"', 'viw<ESC>a"<esc>bi"<esc>ela', ns)  -- Mapeia 'leader+"' para adicionar aspas duplas em torno da palavra sob o cursor no modo normal
set("n", "<Leader>'", "viw<ESC>a'<esc>bi'<esc>ela", ns)  -- Mapeia 'leader+' para adicionar aspas simples em torno da palavra sob o cursor no modo normal
set("n", "<Leader>(", "viw<ESC>a)<esc>bi(<esc>ela", ns)  -- Mapeia 'leader+(' para adicionar parênteses em torno da palavra sob o cursor no modo normal
set("n", "<Leader>[", "viw<ESC>a]<esc>bi[<esc>ela", ns)  -- Mapeia 'leader+[' para adicionar colchetes em torno da palavra sob o cursor no modo normal
set("n", "<Leader>{", "viw<ESC>a}<esc>bi{<esc>ela", ns)  -- Mapeia 'leader+{' para adicionar chaves em torno da palavra sob o cursor no modo normal
set("n", "<Leader><", "viw<ESC>a><esc>bi<<esc>ela", ns)  -- Mapeia 'leader+<' para adicionar sinais de menor em torno da palavra sob o cursor no modo normal

-- Inicia uma sequência de comandos vim
-- No modo de inserção, se o menu pop-up estiver visível, confirma a seleção, caso contrário, insere uma nova linha
-- No modo de inserção, se o menu pop-up estiver visível, confirma a seleção com a função coc#_select_confirm(), caso contrário, insere uma nova linha
cmd[[  
  inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"  
  inoremap <silent><expr><CR> pumvisible() ? coc#_select_confirm()
    \: "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"  
]]  -- Fim da sequência de comandos vim

set("n", "<Leader>o", ":NERDTreeToggle<CR>", ns)  -- Mapeia 'leader+o' para alternar a visibilidade do NERDTree no modo normal
set("n", "<Leader>R", ":NERDTreeToggle<CR>R", ns)  -- Mapeia 'leader+R

