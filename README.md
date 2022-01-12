<div align="center">

### ~/. my dotfiles ~/. :house:&nbsp;

#### \> Managed with chezmoi :robot:&nbsp;

</div>

## :book:&nbsp; Overview

This repository contains all my dotfiles managed by [chezmoi](https://github.com/twpayne/chezmoi).
Please note that this is my own personal dotfiles.
Stuffs may change without further notice and this README can get outdated.

## :camera:&nbsp; Screenshots

**Sway**
![sway](https://user-images.githubusercontent.com/13085918/148652282-9c90e899-9883-4e39-8404-5858daad7a63.png)

**Tmux**
![tmux](https://user-images.githubusercontent.com/13085918/148652287-279efd94-4781-46fb-a658-2b286f056410.png)

**Fish prompt**
![fish](https://user-images.githubusercontent.com/13085918/148652293-8941d1c7-aa36-4902-ae0c-26ad38f7022f.png)

**Neovim**
![01-nvim](https://user-images.githubusercontent.com/13085918/148652297-4446e0d8-08c2-4199-bc9b-44831691dd26.png)
![02-nvim](https://user-images.githubusercontent.com/13085918/148652302-522d26f9-73be-47f0-ae91-2652f905f797.png)

## :file_folder:&nbsp; Included Plugins

### :fish:&nbsp; Fish

I use [fisher](https://github.com/jorgebucaran/fisher) as my plugin manager.
These are the plugins I'm using:

- [Starship](https://starship.rs/)
- [FZF Fish](https://github.com/patrickF1/fzf.fish)
- [Puffer Fish](https://github.com/nickeb96/puffer-fish)
- [tmux.fish](https://github.com/budimanjojo/tmux.fish)
- [autopair.fish](https://github.com/jorgebucaran/autopair.fish)
- [fish-abbreviation-tips](https://github.com/gazorby/fish-abbreviation-tips)

To update fish plugins, type in `fisher update` in terminal.
To install or remove fish plugins, you can run `fisher` command.

### :memo:&nbsp; Neovim

I use [packer.nvim](https://github.com/wbthomason/packer.nvim) as my plugin manager.
These are the plugins I'm using:

- [ansible-vim](https://github.com/pearofducks/ansible-vim)
- [better-escape.nvim](https://github.com/max397574/better-escape.nvim)
- [chezmoi.vim](https://github.com/alker0/chezmoi.vim)
- [colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)
- [Comment.nvim](https://github.com/numToStr/Comment.nvim)
- [FTerm.nvim](https://github.com/numToStr/FTerm.nvim)
- [fzf-lua](https://github.com/ibhagwan/fzf-lua)
- [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [lspconfig](https://github.com/neovim/nvim-lspconfig)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [nvim-base16](https://github.com/RRethy/nvim-base16)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)
- [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer)
- [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)
- [surround.nvim](blackCauldron7/surround.nvim)
- [Trouble](https://github.com/folke/trouble.nvim)

To update Neovim plugins, do `:PackerSync` in your nvim.
**Note**: You need Neovim version >=0.6.0

## :package:&nbsp; Dependencies

You need to have these packages installed in your system if you want to set up:

**For Sway:**

```
waybar
grim
slurp
swayidle
python-i3ipc
rofi (optional)
nwg-dock (optional)
```

**For i3**

```
py3status
scrot
i3lock
picom (optional)
rofi (optional)
xfce4-panel (optional)
```

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
exa
```

**For Neovim:**

```
nvim
git
curl
npm
fzf
unzip
```

## :abcd:&nbsp; Fonts

Starship and Lualine requires powerline fonts to work.
I suggest [Nerd-fonts](https://github.com/ryanoasis/nerd-fonts).
The font in the screenshot above is using UbuntuMono Nerd Font Regular.
I also need Unifont installed in the system for some glyphs to work.
Chezmoi will do this automatically for you.

## :inbox_tray:&nbsp; Installation

Git clone this repository into your host machine:
`git clone https://github.com/budimanjojo/dotfiles.git`
Run install.sh:
`./install.sh`
Then do `chezmoi init --apply budimanjojo`

## :scroll:&nbsp; Cheatsheet

### Sway/i3 keybindings

I use `Super` and `Alt` key for Sway/i3.
`hjkl` keys are mapped to `left`, `down`, `up`, `right` arrow keys.
`S` means Super key, [0-9] means number key 0 to 9.

| Keypress        | Description |
| :-------------: | :---------- |
| `S+t`           | Open terminal app |
| `S+w`           | Open browser |
| `S+f`           | Open file manager |
| `S+g`           | Open GIMP |
| `S+b`           | Open OBS |
| `S+s`           | Open Steam |
| `S+grave`       | Open rofi apps menu|
| `S+Tab`         | Open rofi opened apps menu |
| `Alt+F4`        | Close window |
| `Alt+k`         | Change focus to window above |
| `Alt+j`         | Change focus to window below |
| `Alt+h`         | Change focus to left side window |
| `Alt+l`         | Change focus to right side window |
| `Alt+Shift+k`   | Move focused window up |
| `Alt+Shift+j`   | Move focused window down |
| `Alt+Shift+h`   | Move focused window left |
| `Alt+Shift+l`   | Move focused window right |
| `Alt+Ctrl+h`    | Split opened windows horizontally |
| `Alt+Ctrl+v`    | Split opened windows vertically |
| `Alt+Ctrl+q`    | Toggle opened windows split |
| `S+Tab`         | Go to next workspace |
| `S+Shift+Tab`   | Go to previous workspace |
| `Alt+Ctrl+t`    | Toggle window border on/off |
| `Alt+Ctrl+g`    | Toggle gaps on/off |
| `Alt+Ctrl+f`    | Toggle fullscreen mode on/off |
| `Alt+Ctrl+s`    | Change container layout to stacking |
| `Alt+Ctrl+w`    | Change container layout to tabbed |
| `Alt+Ctrl+e`    | Toggle split layout to horizontal/vertical |
| `S+Shift+Space` | Toggle window floating on/off |
| `S+Space`       | Swap focus between tiling/floating window |
| `S+Shift+-`     | Move current focused window to scratchpad |
| `S+-`           | Show/hide scratchpad window |
| `S+[0-9]`       | Go to workspace #[0-9] |
| `S+Shift+[0-9]` | Move focused window to workspace #[0-9] |
| `Alt+Shift+r`   | Go to resize container mode |
| `Alt+Shift+g`   | Go to resize gaps mode |
| `Alt+Ctrl+Del`  | Go to logout mode |
| `Printscreen`   | Go to screenshot mode |
| `S+Shift+c`     | Reload Sway configuration |
| `S+Shift+e`     | Exit Sway |

### Neovim keybindings

The prefix key is `Space`.
You can override this using your custom `.vimrc.local` file.
`<Leader>` means you need to press prefix key first.
If they are not in the table, that means it's using the default Vim keybindings.

| Mode          | Keypress      | Description |
| :-----------: | :-----------: | :---------- |
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
| Normal/Term   | `Control+t`   | Toggle floating terminal |
| Normal        | `<Leader>pp`  | Format buffer with null-ls |
| Visual        | `<Leader>pp`  | Range format buffer with null-ls |
| Normal        | `rn`          | Do LSP buffer rename |
| Normal        | `gd`          | Do LSP buffer get definition |
| Normal        | `gD`          | Do LSP buffer get declaration |
| Normal        | `gh`          | Do LSP buffer get hover |
| Normal        | `gr`          | Do LSP buffer get references |
| Normal        | `gi`          | Do LSP buffer get implementation |

### Tmux keybindings

I override the default keybindings for Tmux to be more reasonable.
Prefix key is `Alt+a` for local session and `Alt+z` for nested session.
You can of course override this.
`<prefix>` means you need to press prefix key first, `<repeat>` means you don't need to press prefix key again after triggering it within `repeat-time` set (default set to 1 second), `<copy-mode>` means you must be in copy-mode first.
The table below lists all the keybindings set.
If they are not in the table, that means it's using the default Tmux keybindings.

| Keypress                | Description |
| :---------------------: | :---------- |
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
