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
   - Install ripgrep (if you don't already have it): `brew install ripgrep` or `apt install ripgrep` or `yum install ripgrep`
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

---

## NeoVim Shortcuts Guide

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
- `G`: Jump to the last line of the file.
- `gg`: Go to the first line.
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

### Visual Mode Shortcuts

In Visual Mode, manipulate text selections with:

- `v`, `V`: Start visual mode with or without cursor movement.
- `>`, `<`, `>>`, `<<`: Indent or unindent text or text blocks.
- `s`, `S`, `x`, `X`: Delete or cut text, optionally moving the cursor to the next line.
- `y`, `Y`, `p`, `P`: Copy or paste text, adjusting cursor position as needed.

### Tips and Tricks

- **Indentation**: Use `>` and `<` in Visual Mode for adjusting indentation levels.

- **Word Replacement**: Utilize `:%s/old/new/g` for global search and replace. Use `:%s/old/new/gc` for confirm before replacing.

- **File Searching**: Use `:/pattern` to search within a file, navigating results with `n` (next) and `N` (previous). To clear search highlights, use `:noh`.

- **Case Sensitivity**: Use `:set case sensitive` for case-sensitive searches. Alternatively, `\c` in your search pattern (`:/\cpattern`) makes the search case insensitive.

- **Custom Key Bindings**: Customize key mappings in your `init.vim` to streamline actions such as navigation, editing, and accessing frequently used features.

- **Plugin Management**: Utilize plugin managers like `vim-plug` or `packer.nvim` to easily install, update, and manage your NeoVim plugins.

- **Theme and Aesthetics**: Choose a theme that suits your visual preference and enhances readability. Many themes also offer support for `nvim-treesitter`, improving syntax highlighting.

- **Single Line Duplication**: The `yyp` or `Yp` command duplicates the current line by yanking and pasting it.

- **Multiple Lines**: In Visual Mode, select multiple lines with `v` or `V`, then `y` to yank and `p` to paste.

- **Using Command Line**: `:t.` duplicates the current line below itself. For duplicating multiple times, use `:.t.+1N`, replacing N with the desired number of duplicates.

- **Reload configuration**: Use `:source $MYVIMRC` to reload your NeoVim configuration.

## Plugins

### Error Navigation with Trouble Plugin

The Trouble plugin facilitates navigating through code errors and diagnostics. Configure key mappings for efficient use:

- `<leader>xx`: Toggle the Trouble window.
- `<leader>xw`: Display workspace diagnostics.
- `<leader>xd`: Show document diagnostics.
- `<leader>xq`: Toggle the quickfix list.
- `<leader>xl`: Toggle the location list.
- `gR`: Show references of the symbol under the cursor in Trouble.

---

## Plugins

**LSP and Autocompletion**: `lsp-zero.nvim` and its dependencies provide rich language features and intelligent code completion.

- **UI Enhancements**: Themes like `tokyonight.nvim` and utility plugins like `fidget.nvim` improve visual feedback and aesthetics.
- **Navigation and File Management**: Plugins like `neo-tree.nvim` and `telescope.nvim` offer advanced file exploration and search capabilities.
- **Code Formatting and Comments**: `nvim-comment` and `indentmini.nvim` assist with code formatting and easy commenting.
- **Git Integration**: `vim-fugitive`, `vim-rhubarb`, and `gitsigns.nvim` offer seamless Git integration directly within Vim.
- **Status Line and Tab Line**: `lualine.nvim` is configured for a customizable status line, showcasing essential information.
- **Syntax Highlighting**: `nvim-treesitter` provides advanced syntax highlighting for a wide range of programming languages.
- **Productivity Tools**: `undotree`, `harpoon`, and `todo-comments.nvim` are among the plugins that enhance productivity by offering project navigation, undo history, and todo management.

### Plugin neo-tree

- `space + n` Open and close the tree

## Configurações do plugin trouble

Esse plugin serve para navegar pelos erros

vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)

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
