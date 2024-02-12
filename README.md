<div align="center">

### ~/. my dotfiles ~/. :house:&nbsp;

#### \> Managed with chezmoi :robot:&nbsp; and NixOS :snowflake:&nbsp;

</div>

## :book:&nbsp; Overview

This repository contains all my dotfiles managed by [chezmoi](https://github.com/twpayne/chezmoi).
Please note that this is my own personal dotfiles.
Stuffs may change without further notice and this README can get outdated.
For [NixOS](https://nixos.org) users, head over [here](./nixos)

## :camera:&nbsp; Screenshots

**Sway**
![sway](https://user-images.githubusercontent.com/13085918/155890643-aa0adb3c-695f-497d-9d5d-d4bb61907cd0.png)

**Tmux**
![tmux](https://user-images.githubusercontent.com/13085918/155890745-5fc83821-8008-4f91-8ebc-5852badeca22.png)

**Fish prompt**
![fish](https://user-images.githubusercontent.com/13085918/155890660-57039ad8-d769-4044-ad38-a4b821c634e9.png)

**Neovim**
![nvim1](https://user-images.githubusercontent.com/13085918/155890675-a3b8b3f8-479c-4fd0-9ed6-c74e0fc4de0a.png)
![nvim2](https://user-images.githubusercontent.com/13085918/155890676-38b95046-c35d-4db5-aa01-b9d8ee44f9d0.png)

## :file_folder:&nbsp; Included Plugins

### :fish:&nbsp; Fish

I use [fisher](https://github.com/jorgebucaran/fisher) as my plugin manager.
These are the plugins I'm using:

- [Starship](https://starship.rs/)
- [FZF Fish](https://github.com/patrickF1/fzf.fish)
- [Puffer Fish](https://github.com/nickeb96/puffer-fish)
- [autopair.fish](https://github.com/jorgebucaran/autopair.fish)
- [fish-abbreviation-tips](https://github.com/gazorby/fish-abbreviation-tips)

To update fish plugins, type in `fisher update` in terminal.
To install or remove fish plugins, you can run `fisher` command.

### :memo:&nbsp; Neovim

I use [lazy.nvim](https://github.com/folke/lazy.nvim) as my plugin manager.
These are the plugins I'm using:

- [ansible-vim](https://github.com/pearofducks/ansible-vim)
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
- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)
- [mason.nvim](https://github.com/williamboman/mason.nvim)
- [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)
- [oil.nvim](https://github.com/stevearc/oil.nvim)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)
- [nvim-surround](https://github.com/kylechui/nvim-surround)
- [trouble](https://github.com/folke/trouble.nvim)
- [presence.nvim](https://github.com/andweeb/presence.nvim)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [b64.nvim](https://github.com/taybart/b64.nvim)

To update Neovim plugins, do `:Lazy update` in your nvim.
**Note**: You need Neovim version >=0.7.0

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

### Sway/i3/Hyprland keybindings

I use `Super` key for Sway/i3.
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
| `S+F4`          | Close window |
| `S+k`           | Change focus to window above |
| `S+j`           | Change focus to window below |
| `S+h`           | Change focus to left side window |
| `S+l`           | Change focus to right side window |
| `S+Shift+k`     | Move focused window up |
| `S+Shift+j`     | Move focused window down |
| `S+Shift+h`     | Move focused window left |
| `S+Shift+l`     | Move focused window right |
| `S+Ctrl+h`      | Split opened windows horizontally |
| `S+Ctrl+v`      | Split opened windows vertically |
| `S+Ctrl+q`      | Toggle opened windows split |
| `S+Tab`         | Go to next workspace |
| `S+Shift+Tab`   | Go to previous workspace |
| `S+Ctrl+t`      | Toggle window border on/off |
| `S+Ctrl+g`      | Toggle gaps on/off |
| `S+Ctrl+f`      | Toggle fullscreen mode on/off |
| `S+Ctrl+s`      | Change container layout to stacking |
| `S+Ctrl+w`      | Change container layout to tabbed |
| `S+Ctrl+e`      | Toggle split layout to horizontal/vertical |
| `S+Shift+Space` | Toggle window floating on/off |
| `S+Space`       | Swap focus between tiling/floating window |
| `S+Shift+p`     | Move current focused window to scratchpad |
| `S+p`           | Show/hide scratchpad window |
| `S+[0-9]`       | Go to workspace #[0-9] |
| `S+Shift+[0-9]` | Move focused window to workspace #[0-9] |
| `S+Shift+r`     | Go to resize container mode |
| `S+Shift+g`     | Go to resize gaps mode |
| `S+Ctrl+Del`    | Go to logout mode |
| `Printscreen`   | Go to screenshot mode |
| `S+Shift+c`     | Reload Sway configuration |
| `S+Shift+e`     | Exit Sway |

### Neovim keybindings

The prefix key is `Space`.
You can override this using your custom `.vimrc.local` file.
`<Leader>` means you need to press prefix key first.
If they are not in the table, that means it's using the default Vim keybindings.

| Mode            | Keypress      | Description |
| :-------------: | :-----------: | :---------- |
| `Normal`        | `<Leader>w`   | Save file |
| `Normal`        | `<Leader>x`   | Save file and quit |
| `Normal`        | `<Leader>qq`  | Quit |
| `Normal`        | `<Leader>qa`  | Force quit without saving |
| `Normal`        | `<Leader>wq`  | Save file and quit |
| `Normal`        | `Y`           | Yank from cursor to end of file |
| `Normal`        | `K`           | Move Up one paragraph |
| `Normal`        | `J`           | Move Down one paragraph |
| `Normal`        | `H`           | Move to the first character in line |
| `Normal`        | `L`           | Move to the last character in line |
| `Visual`        | `J`           | Move selected line up and down |
| `Visual`        | `K`           | Move selected line up and down |
| `Normal`        | `Control+k`   | Move to the split window above |
| `Normal`        | `Control+j`   | Move to the split window below |
| `Normal`        | `Control+h`   | Move to the left split window |
| `Normal`        | `Control+l`   | Move to the right split window |
| `Normal`        | `<Leader>s`   | Open new horizontal split window |
| `Normal`        | `<Leader>v`   | Open new vertical split window |
| `Insert`        | `Control+k`   | Move cursor Up |
| `Insert`        | `Control+j`   | Move cursor Down |
| `Insert`        | `Control+h`   | Move cursor Left |
| `Insert`        | `Control+l`   | Move cursor Right |
| `Normal`        | `<Leader>tn`  | Open new tab |
| `Normal`        | `<Leader>td`  | Close tab |
| `Normal`        | `<Leader>th`  | Go to previous tab |
| `Normal`        | `<Leader>tl`  | Go to next tab |
| `Normal`        | `<Leader>te`  | Open new tab with current buffer's path |
| `Normal`        | `<Leader>hh`  | Jump back to older cursor position |
| `Normal`        | `<Leader>ll`  | Jump forward to newer cursor position |
| `Normal/Visual` | `Tab`         | Indent current line or selection |
| `Normal/Visual` | `Shift+Tab`   | De-indent current line or selection |
| `Normal`        | `<Leader>lr`  | Restart LSP client |
| `Normal`        | `<Leader>fz`  | Open FzfLua |
| `Normal`        | `<Leader>ff`  | Open FzfLua to find files |
| `Normal`        | `<Leader>fg`  | Open FzfLua to live grep |
| `Normal`        | `<Leader>fc`  | Open FzfLua to see git commits |
| `Normal`        | `<Leader>fb`  | Open FzfLua to see opened buffers |
| `Normal`        | `<Leader>fh`  | Open FzfLua to find help |
| `Normal`        | `<Leader>fk`  | Open FzfLua to see keymappings |
| `Normal`        | `<Leader>fe`  | Open FzfLua to find lsp diagnostics |
| `Normal`        | `<Leader>fr`  | Open FzfLua to find lsp references |
| `Normal`        | `<Leader>fd`  | Open FzfLua to find lsp typedefs |
| `Normal`        | `<Leader>xx`  | Toggle Trouble |
| `Normal`        | `<Leader>xr`  | Toggle Trouble to find lsp references |
| `Normal`        | `Control+f`   | Toggle oil.nvim file manager |
| `Normal/Term`   | `Control+t`   | Toggle floating terminal |
| `Normal`        | `<Leader>pp`  | Format buffer with null-ls |
| `Visual`        | `<Leader>pp`  | Range format buffer with null-ls |
| `Normal`        | `rn`          | Do LSP buffer rename |
| `Normal`        | `gd`          | Do LSP buffer get definition |
| `Normal`        | `gD`          | Do LSP buffer get declaration |
| `Normal`        | `gh`          | Do LSP buffer get hover |
| `Normal`        | `gr`          | Do LSP buffer get references |
| `Normal`        | `gi`          | Do LSP buffer get implementation |

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

### Zellij keybindings

I'm migrating my tmux to [Zellij](https://zellij.dev/).
I mimicked my tmux configuration to work in zellij but not everything works the same.
Prefix key is `Alt+a`, I use the "switch to normal mode" in zellij to achieve this.
`<normal>` means you need to be in normal mode, `<pane>` means pane mode, and so on.
The table below lists all the keybindings set.

| Keypress               | Description |
| :--------------------: | :---------- |
| `<locked>Alt+a`        | Swith to normal mode (act like prefix key in tmux) |
| `<normal>Alt+s`        | Create new horizontal split window and back to locked mode |
| `<normal>Alt+v`        | Create new vertical split window and back to locked mode |
| `<normal>r`            | Switch to renametab mode |
| `<normal>h`            | Move selection to left pane |
| `<normal>j`            | Move selection to pane below |
| `<normal>k`            | Move selection to pane above |
| `<normal>l`            | Move selection to right pane |
| `<normal>>`            | Move pane around |
| `<normal>H`            | Resize current pane upwards |
| `<normal>J`            | Resize current pane downwards |
| `<normal>H`            | Resize current pane to the left |
| `<normal>L`            | Resize current pane to the right |
| `<normal>Alt+n`        | Go to next window |
| `<normal>Alt+p`        | Go to previous window |
| `<normal>c`            | Open new tab and back to locked mode |
| `<normal>x`            | Close current pane and back to locked mode |
| `<normal>a`            | Open pane with $EDITOR and back to locked mode |
| `<normal>Esc/' '/"\n"` | Switch back to locked mode |
| `<renametab>Alt+a`     | Switch to normal mode |
| `<renametab>"\n"`      | Switch to locked mode |
| `<renametab>Esc`       | Confirm tab name and back to locked mode |
