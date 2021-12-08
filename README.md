# dotfiles

This repository contains all my dotfiles managed by [chezmoi](https://github.com/twpayne/chezmoi). Please note that this is my own personal dotfiles. You can fork this repository and use your own zshrc and vimrc by replacing yours with mine and run the install script.
In the future, I will make this customizable for custom changes, but that's when I'm free and not guaranteed. I may not even look at this README again after setting up all my machines.

## Screenshots

**Tmux**
![render1561745632013](https://user-images.githubusercontent.com/13085918/60362720-d7f53580-9a0b-11e9-9876-79d6d18c998b.gif)

**Fish prompt (to be updated)**
![screenshot-2019-06-12_01-05-09](https://user-images.githubusercontent.com/13085918/59295937-0acec800-8caf-11e9-94ed-c88c5703e963.png)

**Neovim (to be updated)**
![screenshot-2019-06-12_01-07-25](https://user-images.githubusercontent.com/13085918/59295949-0dc9b880-8caf-11e9-8617-e4310db78f84.png)

## What Are Included

### Fish

I use [fisher](https://github.com/jorgebucaran/fisher) as my plugin manager and use these plugins:

- [Starship](https://starship.rs/) as the prompt theme
- [FZF Fish](https://github.com/patrickF1/fzf.fish) as [fzf](https://github.com/junegunn/fzf) for fish
- [Puffer Fish](https://github.com/nickeb96/puffer-fish) as text expansion for fish
- [tmux.fish](https://github.com/budimanjojo/tmux.fish) as tmux plugin for fish
- [autopair.fish](https://github.com/jorgebucaran/autopair.fish) as auto matching pair for fish
- [fish-abbreviation-tips](https://github.com/gazorby/fish-abbreviation-tips) as tips to help remember abbrs and aliases
- [kubectl](https://github.com/evanlucas/fish-kubectl-completions) as kubectl completions for fish

My shell colorscheme is set to `base16-google-dark` using [base16-shell](https://github.com/chriskempson/base16-shell)

### Neovim

I use [packer.nvim](https://github.com/wbthomason/packer.nvim) as my plugin manager and add these plugins:

- [nvim-base16](https://github.com/RRethy/nvim-base16) for colorscheme theme
- [colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) for color highlighter
- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) for autoclosing html tags
- [surround.nvim](blackCauldron7/surround.nvim) to manage surrounding characters
- [Trouble](https://github.com/folke/trouble.nvim) to show LSP trouble in pretty list
- [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim) to add indentation guides
- [Comment.nvim](https://github.com/numToStr/Comment.nvim) to comment codes
- [better-escape.nvim](https://github.com/max397574/better-escape.nvim) the better escape insert mode for nvim
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) to automatically insert pairs
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) as statusline
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) syntax highlighting
- [fzf-lua](https://github.com/ibhagwan/fzf-lua) as fzf wrapper for nvim
- [lspconfig](https://github.com/neovim/nvim-lspconfig) as LSP client
- [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua) as file explorer for nvim
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) as completion plugin
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) as snippet engine
- [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) as linter and formatter for nvim

**Note**: You need Neovim version >=0.5.0

### Tmux

I set my prefix key to `Alt+a` instead of the default `Ctrl+b`.

## Dependencies

You need to have these packages installed in your system if you want to set up:

**For Fish:**

```
fish
git
fd
bat
chsh
fzf
zoxide
curl/wget
```

**For Neovim:**

```
nvim
git
curl
npm
fzf
```

**For Tmux:**

`tmux`

## Fonts

Starship and Vim-airline requires powerline fonts to work. I suggest [Nerd-fonts](https://github.com/ryanoasis/nerd-fonts) because that is what I'm using. The font in the screenshot above is using UbuntuMono Nerd Font Regular. Chezmoi to install will do this automatically for you.

## Installation

Git clone this repository into your host machine:
`git clone https://github.com/budimanjojo/dotfiles.git`
Run install.sh:
`./install.sh`

## Updating

**Fish**
To update fish plugins, type in `fisher update` in terminal.

**Neovim**
To update Neovim plugins, do `:PackerSync` in your nvim.

## Cheatsheet

**Vim**
The prefix key is `Space`. You can override this using your custom `.vimrc.local` file. `<Leader>` means you need to press prefix key first. If they are not in the table, that means it's using the default Vim keybindings.

| Mode          | Vim Keypress  | Description |
| :-----------: | :-----------: | :---------: |
| Normal        | `<Leader>w`   | Save file |
| Normal        | `<Leader>x`   | Save file and quit |
| Normal        | `<Leader>qq`  | Quit |
| Normal        | `<Leader>qa`  | Force quit without saving |
| Normal        | `<Leader>wq`  | Save file and quit |
| Normal        | `Y`           | Yank from cursor to end of file |
| Insert        | `ii`          | Exit Insert mode |
| Normal        | `K`           | Move Up one paragraph |
| Normal        | `J`           | Move Down one paragraph |
| Normal        | `H`           | Move to the first character in line |
| Normal        | `L`           | Move to the last character in line |
| Normal        | `Control+k`   | Move to the split window above |
| Normal        | `Control+j`   | Move to the split window below |
| Normal        | `Control+h`   | Move to the left split window |
| Normal        | `Control+l`   | Move to the right split window |
| Normal        | `<Leader>s`   | Open new horizontal split window |
| Normal        | `<Leader>v`   | Open new vertical split window |
| Insert        | `Control+k`   | Move cursor Up |
| Insert        | `Control+j`   | Move cursor Down |
| Insert        | `Control+h`   | Move cursor Left |
| Insert        | `Control+l`   | Move cursor Right |
| Normal        | `<Leader>tn`  | Open new tab |
| Normal        | `<Leader>td`  | Close tab |
| Normal        | `<Leader>th`  | Go to previous tab |
| Normal        | `<Leader>tl`  | Go to next tab |
| Normal        | `<Leader>te`  | Open new tab with current buffer's path |
| Normal/Visual | `Tab`         | Indent current line or selection |
| Normal/Visual | `Shift+Tab`   | De-indent current line or selection |
| Normal        | `<Leader>fz`  | Open FzfLua |
| Normal        | `<Leader>ff`  | Open FzfLua to find files |
| Normal        | `<Leader>fg`  | Open FzfLua to live grep |
| Normal        | `<Leader>fc`  | Open FzfLua to see git commits |
| Normal        | `<Leader>fb`  | Open FzfLua to see opened buffers |
| Normal        | `<Leader>fh`  | Open FzfLua to find help |
| Normal        | `<Leader>fk`  | Open FzfLua to see keymappings |
| Normal        | `<Leader>fe`  | Open FzfLua to find lsp diagnostics |
| Normal        | `<Leader>fr`  | Open FzfLua to find lsp references |
| Normal        | `<Leader>fd`  | Open FzfLua to find lsp typedefs |
| Normal        | `<Leader>xx`  | Toggle Trouble |
| Normal        | `<Leader>xr`  | Toggle Trouble to find lsp references |
| Normal        | `Control+f`   | Toggle nvim-tree file manager |
| Normal        | `<Leader>pp`  | Format buffer with null-ls |
| Visual        | `<Leader>pp`  | Range format buffer with null-ls |
| Normal        | `rn`          | Do LSP buffer rename |
| Normal        | `gd`          | Do LSP buffer get definition |
| Normal        | `gD`          | Do LSP buffer get declaration |
| Normal        | `gh`          | Do LSP buffer get hover |
| Normal        | `gr`          | Do LSP buffer get references |
| Normal        | `gi`          | Do LSP buffer get implementation |

**Tmux**
I override the default keybindings for Tmux to be more reasonable. Prefix key is `Alt+a` for local session and `Alt+z` for nested session. You can of course override this. `<prefix>` means you need to press prefix key first, `<repeat>` means you don't need to press prefix key again after triggering it within `repeat-time` set (default set to 1 second), `<copy-mode>` means you must be in copy-mode first. The table below lists all the keybindings set. If they are not in the table, that means it's using the default Tmux keybindings.

| Tmux Keypress           | Description |
| :---------------------: | :---------: |
| `<prefix>Alt+e`         | Edit tmux.conf.local file and reload configuration after saving |
| `<prefix>Alt+r`         | Reload tmux configuration |
| `<prefix>f`             | Find session, window, pane from list |
| `<prefix>Alt+s`         | Create new horizontal split window |
| `<prefix>Alt+v`         | Create new vertical split window |
| `<prefix>r`             | Rename current window |
| `<prefix>R`             | Rename current session |
| `<prefix><repeat>k`     | Move selection to pane above |
| `<prefix><repeat>j`     | Move selection to pane below |
| `<prefix><repeat>h`     | Move selection to left pane |
| `<prefix><repeat>l`     | Move selection to right pane |
| `<prefix><repeat>>`     | Swap to next pane |
| `<prefix><repeat><`     | Swap to previous pane |
| `<prefix><repeat>K`     | Resize current pane upwards |
| `<prefix><repeat>J`     | Resize current pane downwards |
| `<prefix><repeat>H`     | Resize current pane to the left |
| `<prefix><repeat>L`     | Resize current pane to the right |
| `<prefix><repeat>Alt+n` | Move selection to next window |
| `<prefix><repeat>Alt+p` | Move selection to previous window |
| `<prefix><repeat>Tab`   | Move selection to next window |
| `<prefix>S`             | Join current pane to selected window in horizontal split |
| `<prefix>V`             | Join current pane to selected window in vertical split |
| `<prefix>x`             | Close current pane |
| `<prefix>X`             | Close current window |
| `<prefix>Alt+x`         | Close all other windows |
| `<prefix>a`             | Get into copy mode |
| `<prefix>p`             | Paste copied text from last buffer |
| `<prefix>P`             | Paste copied text from list |
| `<copy-mode>y`          | Copy selected text |
| `<copy-mode>Y`          | Copy the whole line of selected text |
| `<copy-mode>D`          | Copy till the end of line from selected text |

## Customization

**Fish**
To install or remove fish plugins, you can run `fisher` command.

To change the included `base16-google-dark` colorscheme, you can type `base16` followed by a tab to perform tab completion.

**Vim**
You can create a new file in your `$HOME` folder call `.vimrc.local` and put in what you want to override in that file.

**Tmux**
You can create a new file in your `$HOME` folder call `.tmux.conf.local` and put in what you want to override in that file. After that, source that file in tmux and done. You can do it with this keybindings:

- `Alt+a,Alt+e` to edit tmux.conf.local file
- `Alt+a,Alt+r` to re source your tmux

You can also add Tmux plugins into your .tmux.conf.local file.

## To do

- [ ] Better way to use custom configs
