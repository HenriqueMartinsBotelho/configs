## NeoVim Shortcuts Guide

The complete list of NeoVim shortcuts can be found [here](https://neovim.io/doc/user/quickref.html)

### VsCode Shortcuts

<C-s> : Save

### Normal Mode Shortcuts

In Normal Mode, shortcuts perform a variety of text manipulation and navigation tasks:

- `ciw`: "Change Inner Word" - deletes the current word under the cursor, transitioning into Insert Mode for immediate text entry.
- `i`: Enter Insert Mode at the cursor's position.
- `I`: Insert text at the beginning of the line.
- `r`: Replace the character under the cursor.
- `S`: Substitute the entire line, deleting it and entering Insert Mode.
- Navigation keys (`h`, `j`, `k`, `l`) move the cursor left, down, up, and right, respectively.
- `Ctrl+d/u`: Scroll half a screen down/up.
- `Ctrl+f/b`: Scroll a full screen forward/backward.
- `{number}j/k`: Move down/up a specific number of lines, e.g., `10j` moves down 10 lines.
- `{number}G`: Jump to a specified line number, e.g., `50G` goes to line 50.
- `dw`, `diw`: Delete a word from the cursor forward; delete the inner word without including the following space.
- `t<character>`, `f<character>`: Jump to the character before (`t`) or exactly at (`f`) the specified character.
- `,`, `;`: Repeat the last `t` or `f` command in forward or backward direction.
- `y$`: Yank (copy) the line from the cursor to the end.
- `u`, `Ctrl + r`: Undo and redo changes.
- Deletion commands (`d$`, `dd`, `d3j`, `d3k`) remove text from the cursor to the end of the line, the entire line, or specified numbers of lines down/up.
- Word navigation (`w`, `e`, `b`) moves the cursor forward to the start/end of a word or backward to the start of a word.
- `0`, `$`: Move to the start/end of the line.
- `o`, `O`: Insert a new line below/above the cursor.
- `gg`, `G`: Move to the start/end of the file.
- Search navigation (`t`, `T`, `n`, `N`) jumps to the next or previous occurrence of a search pattern.
- Visual block navigation (`v`, `V`) starts visual selection or line-wise visual selection.
- `gd`: Go to definition.
- `gD`: Go to global definition.
- `gf`: Open a file in the same directory as the current file.
- `gF`: Same to `gf`, but try to open the file in the line
- `gt` and `gT`: Go to next/previous tab.
- `#` search backward for the identifier under the cursor
- `g*` like "\*", but also find partial matches
- `g#` like "#", but also find partial matches
- `ya{` and `yi{`: Select text between `{` and `}` or `(` and `)`
- `yiw` and `yiW`: Copy the current word
- `da{` and `di{`: Delete text between `{` and `}`
- `ca{` and `ci{`: Change text between `{` and `}` and go to insert mode.

### Visual Mode Shortcuts

In Visual Mode, manipulate text selections with:

- `gc`: Comment/uncomment the selection.
- `v`, `V`: Start visual mode with or without cursor movement.
- `>`, `<`, `>>`, `<<`: Indent or unindent text or text blocks.
- `s`, `S`, `x`, `X`: Delete or cut text, optionally moving the cursor to the next line.
- `y`, `Y`, `p`, `P`: Copy or paste text, adjusting cursor position as needed.
- `va{`, `vi{`, `va(`, `vi(`: Select text between `{` and `}` or `(` and `)`.
- `viw`: Select the current word.
- `v%`: Select the current block.

### The default file explorer

The neovim default file explorer is netrw. The custom shortcut to open is `<leader>e`.

- `Enter`: Opens a directory or a file.
- `-`: Go up to the parent directory.
- `u`: Go back to the previous directory in the history.
  `gb`: Jump to the most recent directory saved on the "Bookmarks". To create a bookmark we use mb.
- `p`: Opens a preview window.
- `<C-w>z`: Ctrl + w and then z. Closes the preview window.
- `gh`: Toggles the hidden files.
- `%`: Creates a file.
- `R`: Renames a file
- `mt`: Assign the "target directory" used by the move and copy commands.
- `mf`: Marks a file or directory. Any action that can be performed on multiple files depend on these marks. So if you want to copy, move or delete files, you need to mark them.
- `mc`: Copy the marked files in the target directory.
- `mm`: Move the marked files to the target directory.
- `mx`: Runs an external command on the marked files.
- `D`: Deletes a file or an empty directory. vim will not let us delete a non-empty directory. I'll show how to bypass this later on.
- `d`: Creates a directory.

### Custom Shortcuts

`<C-space>`: the plugin tree-sister select the block of code in the cursor.
`shift + h`: in the nvim-neo-tree shows the hidden items.

### Plugin Nvim Tree

`H` - Show hidden files
`I` - Show .gitignore files

### Plugin Vim Visual Multi

select words with `Ctrl-N` (like Ctrl-d in Sublime Text/VS Code)
create cursors vertically with `Ctrl-Down/Ctrl-Up`
select one character at a time with Shift-Arrows
press `n/N` to get next/previous occurrence
press `[/]` to select next/previous cursor
press `q` to skip current and get next occurrence
press `Q` to remove current cursor/selection
start insert mode with `i,a,I,A`

### Tips and Tricks

- **Increase/Decrease window**: Use `<leader> + h/j/k/l` to resize the current window.

- **Indentation**: Use `>` and `<` in Visual Mode for adjusting indentation levels.

- **Word Replacement**: Utilize `:%s/old/new/g` for global search and replace. Use `:%s/old/new/gc` for confirm before replacing.

- **File Searching**: Use `:/pattern` to search within a file, navigating results with `n` (next) and `N` (previous). To clear search highlights, use `:noh`.

- **Case Sensitivity**: Use `:set case sensitive` for case-sensitive searches. Alternatively, `\c` in your search pattern (`:/\cpattern`) makes the search case insensitive.

- **Single Line Duplication**: The `yyp` or `Yp` command duplicates the current line by yanking and pasting it.

- **Multiple Lines**: In Visual Mode, select multiple lines with `v` or `V`, then `y` to yank and `p` to paste.

- **Using Command Line**: `:t.` duplicates the current line below itself. For duplicating multiple times, use `:.t.+1N`, replacing N with the desired number of duplicates.

- :LspRestart: Este comando, disponível em algumas configurações do NeoVim, reinicia os servidores LSP ativos. Isso pode ajudar a reconhecer novas bibliotecas ou mudanças no ambiente sem precisar reiniciar o NeoVim.

## Plugins

`j-hui/fidget.nvim`: Extensible UI for Neovim notifications and LSP progress messages.
`folke/trouble.nvim`: Shows diagnostics in the quickfix and location lists.
**LSP and Autocompletion**: `lsp-zero.nvim` and its dependencies provide rich language features and intelligent code completion.

- **UI Enhancements**: Themes like `tokyonight.nvim` and utility plugins like `fidget.nvim` improve visual feedback and aesthetics.
- **Navigation and File Management**: Plugins like `neo-tree.nvim` and `telescope.nvim` offer advanced file exploration and search capabilities.
- **Code Formatting and Comments**: `nvim-comment` and `indentmini.nvim` assist with code formatting and easy commenting.
- **Git Integration**: `vim-fugitive`, `vim-rhubarb`, and `gitsigns.nvim` offer seamless Git integration directly within Vim.
- **Status Line and Tab Line**: `lualine.nvim` is configured for a customizable status line, showcasing essential information.
- **Syntax Highlighting**: `nvim-treesitter` provides advanced syntax highlighting for a wide range of programming languages.
- **Productivity Tools**: `undotree`, `harpoon`, and `todo-comments.nvim` are among the plugins that enhance productivity by offering project navigation, undo history, and todo management.

# Some theory behind NeoVim

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
