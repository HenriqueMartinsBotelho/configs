local g = vim.g  -- Define g como um atalho para vim.g
local opt = vim.opt  -- Define opt como um atalho para vim.opt
local cmd = vim.cmd  -- Define cmd como um atalho para vim.cmd


-- Inicia uma sequência de comandos vim
-- Adiciona '-' como palavra-chave em arquivos css
-- Adiciona '@-@' como palavra-chave em arquivos scss
-- Remove opções de formatação 'c', 'r' e 'o' para todos os tipos de arquivo

cmd[[  
  autocmd FileType css setl iskeyword+=-  
  autocmd FileType scss setl iskeyword+=@-@  
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions -=o  
]] 

g.SuperTabDefaultCompletionType = '<C-n>'  -- Define a conclusão padrão do SuperTab para '<C-n>'

opt.compatible = false  -- Desativa a compatibilidade com vi
opt.mouse = 'a'  -- Permite o uso do mouse em todos os modos
opt.swapfile = false  -- Desativa a criação de arquivos de troca
opt.hidden = true  -- Permite alternar entre buffers sem salvar
opt.history = 100  -- Define o tamanho do histórico de comandos para 100
opt.lazyredraw = true  -- Ativa a atualização lenta da tela
opt.synmaxcol = 240  -- Define o número máximo de colunas para o realce de sintaxe

opt.termguicolors = true  -- Ativa as cores verdadeiras do terminal
cmd [[ colorscheme dracula ]]  -- Define o esquema de cores para gruvbox
g.transparent_enabled = true  -- Ativa a transparência

opt.number = true  -- Ativa a exibição de números de linha
opt.wrap = false  -- Desativa a quebra automática de linha
opt.signcolumn = 'yes'  -- Mostra a coluna de sinais
opt.showmatch = true  -- Realça o parêntese correspondente
opt.showmode = false  -- Desativa a exibição do modo atual
opt.foldmethod = 'marker'  -- Define o método de dobramento para 'marker'
opt.splitright = true  -- Divide janelas à direita
opt.splitbelow = true  -- Divide janelas abaixo
opt.conceallevel = 0  -- Define o nível de ocultação para 0
opt.cursorline = true  -- Ativa a linha do cursor
opt.scrolloff = 10  -- Define o número de linhas para rolar antes do cursor
opt.expandtab = true  -- Expande tabulações para espaços
opt.shiftwidth = 2  -- Define a largura do shift para 2
opt.tabstop = 2  -- Define o número de espaços em uma tabulação para 2
opt.smartindent = true  -- Ativa a indentação inteligente
opt.list = true  -- Ativa a exibição de caracteres invisíveis
opt.shortmess:append { c = true }  -- Anexa 'c' às mensagens curtas
opt.whichwrap:append {
	['<'] = true,
	['>'] = true,
	[','] = true,
	h = true,
	l = true
}  -- Permite o envolvimento do cursos aos caracteres '<', '>', ',' e 'h' e 'l'.

cmd [[command! Term :botright split term://$SHELL]]  -- Cria um novo comando 'Term' que abre um terminal em uma nova janela na parte inferior

 -- Inicia uma sequência de comandos vim
 -- Define várias configurações quando um terminal é aberto
 -- Inicia a inserção de texto quando um terminal é aberto
 -- Para a inserção ao deixar o buffer do terminal

cmd [[ 
  autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline  
  autocmd TermOpen * startinsert  
  autocmd BufLeave term://* stopinsert  
]]  

-- Inicia uma sequência de comandos vim
-- Define o atalho para criar um novo Floaterminal
-- Define o atalho para navegar para o Floaterminal anterior
-- Define o atalho para navegar para o próximo Floaterminal
-- Define o atalho para alternar o Floaterminal
-- Define o atalho para fechar o Floaterminal
-- Define o título do Floaterminal

cmd [[  
  let g:floaterm_keymap_new = '<Leader>ft'  
  let g:floaterm_keymap_prev = '<Leader>fp'  
  let g:floaterm_keymap_next = '<Leader>fn'  
  let g:floaterm_keymap_toggle = '<Leader>t'  
  let g:floaterm_keymap_kill = '<Leader>fk'  
  let g:floaterm_title='>( /ᐠ｡ꞈ｡ᐟ\ )<'  
]]
