# Welcome to my Neovim configuration project! 👋

In this project, I'll guide you through the process of setting up Neovim, a powerful and efficient text editor, in a single file init.lua. 🌟

So, why should you consider configuring Neovim in a single file? 🤔

Here are some advantages:

1. **Easy to manage**: Having all your configuration in a single file makes it easier to keep track of your settings and customizations. No more searching through multiple files or worrying about overwriting your configurations.
2. **Consistent configuration**: With a single file configuration, you can easily maintain consistent settings across different machines or environments. This is especially useful if you work on multiple projects or collaborate with others.
3. **Improved performance**: By keeping your configuration in a single file, Neovim can load your settings more quickly and efficiently. This can help improve your overall editing experience, especially if you have a lot of plugins or customizations.
4. **Easier backups**: With all your configuration in a single file, it's simpler to create backups and ensure that your settings are safe. No more worrying about losing your customizations due to a mistake or a corrupted configuration file.
5. **Better collaboration**: When working on a team, it's often helpful to share configuration files. With a single file configuration, it's easier to share your settings with others and collaborate on projects.

## Getting Started

1. **Prerequisites**:
    - Ensure you have [NeoVim](https://neovim.io/) installed on your system.

2. **Installation**:
    - Clone this repository to your NeoVim configuration directory:

    ```bash
    git clone https://github.com/HenriqueMartinsBotelho/configs.git ~/.config/nvim
    ```

3. **Configuration**:
    - After cloning, open NeoVim and the `init.lua` file will automatically load your new configuration.
    - You can start editing the `init.lua` file to customize your NeoVim setup. Comments in the file will guide you through the various sections and settings.


## Contributing

Contributions are welcome! If you'd like to improve the configuration or add new features, please feel free to fork the repository, make your changes, and submit a pull request.


## NeoVim Shortcuts

Command + Count + Motion


**Normal Mode**

- `ciw`: "change inner word" it will delete the word and change to insertion mode
- `i`: Insert text at the cursor
- `I`: Insert text at the beginning of the line
- `r`: Replace text at the cursor
- `S`: Replace the entire line
- `h`: Move cursor left
- `l`: Move cursor right
- `j`: Move cursor down
- `k`: Move cursor up
`Ctrl+d`: Desce meia tela.
`Ctrl+u`: Sobe meia tela.
`Ctrl+f`: Desce uma tela inteira (f de "forward").
`Ctrl+b`: Sobe uma tela inteira (b de "backward").
`{número}j`: Desce um número específico de linhas. Por exemplo, 10j desce 10 linhas.
`{número}k`: Sobe um número específico de linhas. Por exemplo, 10k sobe 10 linhas.
`G`: Vai para a última linha do arquivo.
`gg`: Vai para a primeira linha do arquivo.
`{número}G`: Vai para a linha de número especificado. Por exemplo, 50G vai para a linha 50.


- `I`: Go to the beginning of the line (in insertion mode)
- `A`: Go to the end of the line (in insertion mode)
- `dw`: Delete a word from the cursor forward 
- `diw`: Delete inner word in do not include space after the word



- `t<something>` Jumps to before caractere <something>
- `f<something>` Jumps to the caractere <something>
- `, or ;`: repete the last command (forward and backward)


- `y$`: the line from the cursor forward

- `u`: Undo
- `ctrl + r`: Redo

- `d$`: Deletes from the cursor to the end
- `dd`: Delete line
- `d3j`: Delete 3 lines down
- `d3k`: Delete 3 lines up

- `w`: Move cursor forward one word
- `e`: Move cursor to the end of the word
- `b`: Move cursor backward one word

- `11j`: Move cursor down 11 lines
- `11k`: Move cursor up 11 lines

- `0`: Move cursor to the beginning of the line (in normal mode)
- `O`: Move the cursor to the line above
- `o`: Move the cursor to the line bellow
- `$`: Move cursor to the end of the line (in normal mode)
- `gg`: Move cursor to the beginning of the file
- `G`: Move cursor to the end of the file
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


### Shortcuts for Buffers, Windows, and tabs

`Ctrl-w w`: Cycles through windows.
`Ctrl-w h`: Moves the cursor to the window on the left.
`Ctrl-w j`: Moves the cursor to the window below.
`Ctrl-w k`: Moves the cursor to the window above.
`Ctrl-w l`: Moves the cursor to the window on the right.

---

### Buffers
- **What They Are:** Buffers represent open instances of files in memory. When you open a file in NeoVim, it's loaded into a buffer. Even if you're not actively viewing the file, as long as it's open, its buffer exists.
- **Usage:** Buffers are useful for working with multiple files simultaneously without necessarily displaying all of them on the screen.
- **Creation:** Open a file in NeoVim using `:e filename` or `:edit filename`, and it automatically creates a buffer for that file.
- **Navigation:** Switch between buffers using commands like `:bnext` (or `:bn`) for the next buffer, `:bprevious` (or `:bp`) for the previous buffer, and `:buffer N` (where N is the buffer number) to jump directly to a specific buffer.

### Windows
- **What They Are:** Windows are viewports or splits within the NeoVim interface that display buffers. A single buffer can be displayed in multiple windows at the same time, and each window can show a different part of the buffer.
- **Usage:** Windows are useful for visually comparing files side by side or for keeping an eye on one file while editing another.
- **Creation:** Create new windows using commands like `:split` (or `:sp`) to split horizontally, and `:vsplit` (or `:vsp`) to split vertically.
- **Navigation:** Move between windows using the `Ctrl+w` followed by a navigation key (h, j, k, l) which moves left, down, up, and right, respectively.

### Tabs
- **What They Are:** Tabs in NeoVim are collections of windows. Each tab can contain its own set of windows, allowing you to organize your workspace into logical groups.
- **Usage:** Tabs are useful for organizing completely different projects or workspaces within the same NeoVim session.
- **Creation:** Open a new tab with `:tabnew` or `:tabnew filename` to open a specific file in a new tab.
- **Navigation:** Navigate between tabs using `:tabnext` (or `:tabn`) for the next tab, `:tabprevious` (or `:tabp`) for the previous tab, and `:tabfirst` and `:tablast` to jump to the first or last tab, respectively. You can also use `gt` to go to the next tab and `gT` to go to the previous tab.

Para abrir uma nova aba (tab) no Neovim, você pode usar o comando `:tabnew`. Isso criará uma nova aba com um buffer vazio. Se você quiser abrir um arquivo específico em uma nova aba, basta adicionar o caminho do arquivo após o comando, como `:tabnew /caminho/para/seu/arquivo`.

Aqui estão alguns comandos úteis relacionados a abas no Neovim:

- `:tabnew [nome do arquivo]` - Abre uma nova aba com um arquivo especificado. Se nenhum arquivo for especificado, uma nova aba em branco é aberta.
- `:tabclose` - Fecha a aba atual.
- `:tabnext` ou `gt` - Vai para a próxima aba.
- `:tabprev` ou `gT` - Vai para a aba anterior.
- `:tabfirst` - Vai para a primeira aba.
- `:tablast` - Vai para a última aba.
- `:tabmove [número]` - Move a aba atual para a posição especificada (começando de 0).

Você pode combinar esses comandos para gerenciar eficientemente suas abas no Neovim, tornando mais fácil trabalhar com múltiplos arquivos ou projetos simultaneamente.

### Practical Tips
- Understanding and effectively using these concepts allows you to manage complex editing tasks with ease.
- Customize your key bindings to make window, buffer, and tab management more efficient.
- Remember, the power of NeoVim lies in its flexibility; experimenting with different workflows can help you find what best suits your needs.

Each of these concepts serves a different purpose and understanding how to leverage them can significantly boost your workflow in NeoVim.

## Plugins

 **LSP and Autocompletion**: `lsp-zero.nvim` and its dependencies provide rich language features and intelligent code completion.
- **UI Enhancements**: Themes like `tokyonight.nvim` and utility plugins like `fidget.nvim` improve visual feedback and aesthetics.
- **Navigation and File Management**: Plugins like `neo-tree.nvim` and `telescope.nvim` offer advanced file exploration and search capabilities.
- **Code Formatting and Comments**: `nvim-comment` and `indentmini.nvim` assist with code formatting and easy commenting.
- **Git Integration**: `vim-fugitive`, `vim-rhubarb`, and `gitsigns.nvim` offer seamless Git integration directly within Vim.
- **Status Line and Tab Line**: `lualine.nvim` is configured for a customizable status line, showcasing essential information.
- **Syntax Highlighting**: `nvim-treesitter` provides advanced syntax highlighting for a wide range of programming languages.
- **Productivity Tools**: `undotree`, `harpoon`, and `todo-comments.nvim` are among the plugins that enhance productivity by offering project navigation, undo history, and todo management.

### neo-tree

- `space + n` Open and close the tree  


# Substituindo palavras


Para selecionar várias instâncias de uma palavra no Neovim e substituí-las por outra, você pode usar a funcionalidade de busca e substituição. Aqui está um guia passo a passo sobre como fazer isso:

1. **Abra o arquivo no Neovim**: Use o comando `:e caminho/para/seu/arquivo` para abrir o arquivo que você deseja editar.

2. **Entre no modo de comando**: Pressione `:` para entrar no modo de comando.

3. **Use o comando de busca e substituição**: O comando geral para busca e substituição no Neovim (e Vim) é:

   ```
   :%s/velho/novo/g
   ```

   - `%` indica que a substituição deve ocorrer em todo o arquivo. Se você quiser limitar a substituição a um intervalo de linhas, pode substituir `%` por, por exemplo, `1,10` para afetar apenas as linhas 1 a 10.
   - `s` é o comando de substituição.
   - `velho` é a palavra ou padrão que você deseja substituir.
   - `novo` é a palavra ou padrão pelo qual você deseja substituir.
   - `g` ao final indica que todas as instâncias na linha devem ser substituídas. Se você omitir `g`, apenas a primeira instância em cada linha será substituída.

4. **Pressione Enter**: Após digitar o comando de substituição, pressione Enter para executá-lo.

Por exemplo, para substituir todas as instâncias da palavra "gato" por "cachorro" em todo o arquivo, você digitaria:

```
:%s/gato/cachorro/g
```

E pressionaria Enter.

Se você quiser confirmar cada substituição antes de fazê-la, pode adicionar um `c` ao final do comando, assim:

```
:%s/velho/novo/gc
```

Isso fará com que o Neovim pergunte se você deseja substituir cada instância encontrada.

Para realizar uma busca e substituição sem diferenciar entre maiúsculas e minúsculas no Neovim, você pode utilizar o modificador `\c` imediatamente antes do padrão de busca no seu comando de substituição. Isso fará com que a busca seja insensível a maiúsculas e minúsculas. Aqui está como você faria isso:

```
:%s/\cpalavra/nova_palavra/g
```

# Buscas no arquivo

Para realizar uma busca no NeoVim, você pode usar o comando `:/`, seguido pelo termo que deseja procurar. Aqui estão os passos básicos para realizar uma busca:

1. **Iniciar a Busca**: Pressione a tecla `/` para iniciar o modo de busca.
2. **Digitar o Termo de Busca**: Digite o termo que deseja buscar e pressione `Enter`. O NeoVim destacará e irá para a primeira ocorrência do termo buscado no documento.
3. **Navegar pelos Resultados**: Você pode usar `n` para ir para a próxima ocorrência do termo buscado e `N` para ir à ocorrência anterior.

Para limpar digite :noh

Além disso, existem algumas opções de busca que você pode utilizar para refinar a sua pesquisa:

- **Busca Sensível a Maiúsculas e Minúsculas**: Por padrão, a busca no NeoVim é insensível a maiúsculas e minúsculas, a menos que você use letras maiúsculas em sua busca. Se quiser forçar a busca a ser sempre sensível a maiúsculas e minúsculas, você pode usar o comando `:set case sensitive`.
- **Usar Expressões Regulares**: O NeoVim suporta o uso de expressões regulares em suas buscas, o que permite realizar buscas mais complexas e precisas.

Para modificar o comportamento padrão da busca, você pode configurar algumas opções no seu arquivo de configuração `init.vim`. Por exemplo, para fazer com que as buscas sejam sempre sensíveis ao caso, você pode adicionar a linha `set ignorecase` e `set smartcase` no seu `init.vim`. O `ignorecase` faz com que a busca seja insensível a maiúsculas e minúsculas, e o `smartcase` faz com que a busca se torne sensível a maiúsculas se você digitar qualquer letra maiúscula.

Lembrando que o NeoVim é altamente personalizável, então existem muitas outras opções e plugins que podem melhorar ou modificar a forma como você realiza buscas dentro do editor.
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


---

The following sections are only for zellij users.

# Zellij Shortcuts



zellij list-sessions

zellij options --session-name <nome_da_sessao> // para criar uma nova sessão

zellij attach session_name // para ativar uma sessão

zellij delete-session <nome_da_sessao> // para deletar uma sessão

# Tabs and panels

ctrl + t + r // rename tab
ctrl + t + setas // alter entre tabs
ctrl + p + n // creates a panel
cltrl + p + x // close the panel
alt + setas // alternates between the panels
ctrl + n + setas // change the size of the panels
Ctrl + <p> + <w> // showing/hiding floating panes
ctrl + t + x // close actual tab

# outros

ctrl + p + z // para remover a borda verde
Ctrl o + w. // open session-manager
zellij --layout [layout_name] // para mudar o layout






bromodomo
bromodomo

oi

oi

bromodomo

bromodomo

Teste

oioi

Teste
