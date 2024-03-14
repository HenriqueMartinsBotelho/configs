# My configs

1. Neovim

**Insertion Mode**

- `i`: Insert text at the cursor
- `I`: Insert text at the beginning of the line
- `O`: Insert text at the end of the line
- `r`: Replace text at the cursor
- `R`: Replace text at the beginning of the line
- `S`: Replace text at the end of the line

**Normal Mode**

- `h`: Move cursor left
- `l`: Move cursor right
- `j`: Move cursor down
- `k`: Move cursor up

- `u`: Undo
- `ctrl + r`: Redo

- `dd`: Delete line
- `d3j`: Delete 3 lines down
- `d3k`: Delete 3 lines up

- `w`: Move cursor forward one word
- `e`: Move cursor to the end of the word
- `b`: Move cursor backward one word

- `11j`: Move cursor down 11 lines
- `11k`: Move cursor up 11 lines

- `0`: Move cursor to the beginning of the line
- `$`: Move cursor to the end of the line
- `gg`: Move cursor to the beginning of the file
- `G`: Move cursor to the end of the file
- `f`: Move cursor forward one character
- `F`: Move cursor backward one character
- `t`: Move cursor to the next occurrence of a search pattern
- `T`: Move cursor to the previous occurrence of a search pattern
- `n`: Move cursor to the next line
- `N`: Move cursor to the previous line
- `v`: Move cursor to the beginning of the next visual block
- `V`: Move cursor to the beginning of the previous visual block

**Visual Mode**

Yanking and delete goes to the same buffer which means that if you delete a line, and then paste it will paste the same line.

- `v`: Select text visually
- `V`: Select text visually, but don't move the cursor
- `>`: Indent text
- `<`: Unindent text
- `>>`: Indent text block
- `<<`: Unindent text block
- `s`: Delete text
- `S`: Delete text and move cursor to the beginning of the next line
- `x`: Cut text
- `X`: Cut text and move cursor to the beginning of the next line
- `y`: Copy text
- `Y`: Copy text and move cursor to the beginning of the next line
- `p`: Paste text
- `P`: Paste text and move cursor to the beginning of the next line

## Dicas

No Vim, duplicar uma linha pode ser feito de várias maneiras, dependendo das preferências do usuário e do contexto. Aqui estão algumas das maneiras mais comuns de duplicar uma linha:

1. **Usando o comando `yyp`**:

   - `yy` copia a linha atual para o registro do Vim.
   - `p` cola a linha copiada abaixo da linha atual.

2. **Usando o comando `Yp`**:

   - `Y` é equivalente a `yy` (em versões mais antigas do Vim, `Y` copiava a linha inteira, mas configurações modernas frequentemente o fazem agir como `yy`).
   - `p` cola a linha copiada abaixo da linha atual.

3. **Usando o comando `ddp` com um passo extra**:

   - `dd` recorta a linha atual.
   - `p` cola a linha abaixo da posição atual.
   - `u` para desfazer o corte, efetivamente deixando uma cópia da linha.

4. **Usando uma única linha de comando**:

   - `:t.` copia a linha atual abaixo dela mesma.
   - `:t` é um sinônimo para o comando `:copy`.
   - `.` refere-se à linha atual como o local de destino para a cópia.

5. **Usando uma linha de comando com intervalo**:

   - Para duplicar a linha atual N vezes, você pode usar `:.t.+1N` onde N é o número de vezes que você deseja duplicar a linha.
   - Por exemplo, `:.t.+13` duplicaria a linha atual 3 vezes imediatamente abaixo dela.

6. **Comandos em Modo Visual**:
   - Se você estiver em modo visual (`v` para visual ou `V` para linha inteira) e selecionar várias linhas, `y` para copiar e `p` para colar funcionará para o bloco de texto selecionado.

## Configurações do plugin trouble

Esse plugin serve para navegar pelos erros

vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)

## Zellij

zellij list-sessions

zellij options --session-name <nome_da_sessao> // para criar uma nova sessão

zellij attach session_name // para ativar uma sessão

zellij delete-session <nome_da_sessao> // para deletar uma sessão

# Tabs

ctrl + t + r // para renomear uma tab
ctrl + t + setas // alter entre tabs
ctrl + p + n // cria um no panel
alt + setas // alterna para o proximo panel
ctrl + n + setas // para mudar o tamanho dos panels

zellij --layout [layout_name] // para mudar o layout
