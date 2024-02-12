# Plugins

This repository contains my personal Neovim configuration. Here are the plugins used:

- [lazy.nvim](https://github.com/folke/lazy.nvim): Plugin manager for Neovim.
- [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim): Dashboard for Neovim.
- [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim): A tree explorer plugin for Neovim.
- [telescope](https://github.com/nvim-telescope/telescope.nvim): A highly extendable fuzzy finder over lists.
- [lualine](https://github.com/nvim-lualine/lualine.nvim): A fancy statusline for Neovim.
- [comment](https://github.com/numToStr/Comment.nvim): Lean & mean status/tabline for Neovim.
- [nvim-tmux-navigation](https://github.com/alexghergh/nvim-tmux-navigation): Fuzzy file finder for Neovim.
- [mason](https://github.com/williamboman/mason.nvim): Asynchronous linting/fixing for Neovim.
- [catpuccin](https://github.com/catppuccin/nvim): Colorscheme.
- [tokyonight](https://github.com/folke/tokyonight.nvim): Colorscheme.
- [vim-endwise](https://github.com/folke/tokyonight.nvim): Colorscheme.
- [vim-rails](https://github.com/folke/tokyonight.nvim): Colorscheme.

Please refer to the individual plugin's documentation for their usage and configuration details.

## LSP Setup

Ruby LSPs require custom gemsets in ~/.ruby


## Telescope Default Mappings

| Mappings       | Action                                               |
|----------------|------------------------------------------------------|
| `<C-n>/<Down>` | Next item                                            |
| `<C-p>/<Up>`   | Previous item                                        |
| `j/k`          | Next/previous (in normal mode)                       |
| `H/M/L`        | Select High/Middle/Low (in normal mode)              |
| `gg/G`         | Select the first/last item (in normal mode)          |
| `<CR>`         | Confirm selection                                    |
| `<C-x>`        | Go to file selection as a split                      |
| `<C-v>`        | Go to file selection as a vsplit                     |
| `<C-t>`        | Go to a file in a new tab                            |
| `<C-u>`        | Scroll up in preview window                          |
| `<C-d>`        | Scroll down in preview window                        |
| `<C-f>`        | Scroll left in preview window                        |
| `<C-k>`        | Scroll right in preview window                       |
| `<M-f>`        | Scroll left in results window                        |
| `<M-k>`        | Scroll right in results window                       |
| `<C-/>`        | Show mappings for picker actions (insert mode)       |
| `?`            | Show mappings for picker actions (normal mode)       |
| `<C-c>`        | Close telescope (insert mode)                        |
| `<Esc>`        | Close telescope (in normal mode)                     |
| `<Tab>`        | Toggle selection and move to next selection          |
| `<S-Tab>`      | Toggle selection and move to prev selection          |
| `<C-q>`        | Send all items not filtered to quickfixlist (qflist) |
| `<M-q>`        | Send all selected items to qflist                    |
