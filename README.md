# dotfiles
This repository contains all my dotfiles managed by [chezmoi](https://github.com/twpayne/chezmoi). Please note that this is just my own personal dotfiles. You can fork this repository and use your own zshrc and vimrc by replacing yours with mine and run the install script.
In the future, maybe I will make this customizable for custom changes, but that's when I'm free and not guaranteed. I may not even look at this README again after setting up all my machines.

## Screenshots
**Tmux**

![render1561745632013](https://user-images.githubusercontent.com/13085918/60362720-d7f53580-9a0b-11e9-9876-79d6d18c998b.gif)

**Fish prompt** (to be updated)

![screenshot-2019-06-12_01-05-09](https://user-images.githubusercontent.com/13085918/59295937-0acec800-8caf-11e9-94ed-c88c5703e963.png)

**Vim**

![screenshot-2019-06-12_01-07-25](https://user-images.githubusercontent.com/13085918/59295949-0dc9b880-8caf-11e9-8617-e4310db78f84.png)

## What Are Included
**Fish**

I use [fisher](https://github.com/jorgebucaran/fisher) as my plugin manager and use these plugins:
- [Starship](https://starship.rs/) as the prompt theme
- [FZF Fish](https://github.com/patrickF1/fzf.fish) as [fzf](https://github.com/junegunn/fzf) for fish
- [Puffer Fish](https://github.com/nickeb96/puffer-fish) as text expansion for fish
- [kubectl](https://github.com/evanlucas/fish-kubectl-completions) as kubectl completions for fish

My shell colorscheme is set to `base16-google-dark` using [base16-shell](https://github.com/chriskempson/base16-shell)

**Vim**

I use [Vim-plug](https://github.com/junegunn/vim-plug) as my plugin manager and add these plugins:
- [Vim-easy-align](https://github.com/junegunn/vim-easy-align)
- [Vim-colorschemes](https://github.com/flazz/vim-colorschemes)
- [Base16-vim](https://github.com/chriskempson/base16-vim)
- [Vim-airline](https://github.com/vim-airline/vim-airline)
- [Vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
- [Nerdtree](https://github.com/scrooloose/nerdtree)
- [Nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin)
- [Tcomment](https://github.com/tomtom/tcomment_vim)
- [Vim-fugitive](https://github.com/tpope/vim-fugitive)
- [Ale](https://github.com/w0rp/ale)
- [Coc.nvim](https://github.com/neoclide/coc.nvim)
- [Vim-snippets](https://github.com/honza/vim-snippets)
- [Fzf.vim](https://github.com/junegunn/fzf.vim)
- [indentLine](https://github.com/Yggdroot/indentLine)

Coc.nvim will have these extensions inside:
- [coc-json](https://github.com/neoclide/coc-json)
- [coc-snippets](https://github.com/neoclide/coc-snippets)
- [coc-pairs](https://github.com/neoclide/coc-pairs)
- [coc-highlight](https://github.com/neoclide/coc-highlight)
- [coc-tsserver](https://github.com/neoclide/coc-tsserver)
- [coc-tslint](https://github.com/neoclide/coc-tslint)
- [coc-html](https://github.com/neoclide/coc-html)
- [coc-css](https://github.com/neoclide/coc-css)
- [coc-phpls](https://github.com/marlonfan/coc-phpls)
- [coc-stylelint](https://github.com/neoclide/coc-stylelint)
- [coc-vimlsp](https://github.com/iamcco/coc-vimlsp)
- [coc-yaml](https://github.com/neoclide/coc-yaml)
- [coc-emmet](https://github.com/neoclide/coc-emmet)

**Note**: You need Vim version >=8.0 or Neovim version >=0.3.1 in order to use Coc.nvim

**Tmux**

My preferred prefix key is set to `Alt+a` instead of the default `Ctrl+b`.

## Dependencies
You need to have these packages installed in your system if you want to set up:

**For Fish:**

```
zsh
git
fd
bat
chsh
curl/wget
```
**For Vim:**

```
vim/nvim
git
curl
nodejs
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

Fish**

To update fish plugins, simply type in `fisher update` in terminal.

**Vim**

To update Vim plugins, simply do `:PlugUpdate` in your vim. For Coc extensions, you don't have to do anything. It will update by itself when you launch vim.

## Cheatsheet
**Vim**

The prefix key is `Space`. You can override this using your custom `.vimrc.local` file. `<Leader>` means you need to press prefix key first. If they are not in the table, that means it is using the default Vim keybindings.

<table>
    <tr>
        <td nowrap><b>Mode</b></td>
        <td nowrap><b>Vim Keypress</b></td>
        <td><b>Description</b></td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>&lt;leader&gt; w</code></td>
        <td>Save file</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>&lt;leader&gt; x</code></td>
        <td>Save file and quit vim</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>&lt;leader&gt; q</code></td>
        <td>Quit vim</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>&lt;leader&gt; qa</code></td>
        <td>Force quit vim without saving file</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>&lt;leader&gt; wq</code></td>
        <td>Save file and quit vim</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>Y</code></td>
        <td>Yank from cursor to the end of file</td>
    </tr>
    <tr>
        <td nowrap>Insert</td>
        <td nowrap><code>ii</code></td>
        <td>Exit Insert mode</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>K</code></td>
        <td>Move Up one paragraph</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>J</code></td>
        <td>Move Down one paragraph</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>H</code></td>
        <td>Move to the first character in line</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>L</code></td>
        <td>Move to the last character in line</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>Control+k</code></td>
        <td>Move to the split window above</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>Control+j</code></td>
        <td>Move to the split window below</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>Control+h</code></td>
        <td>Move to the left split window</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>Control+l</code></td>
        <td>Move to the right split window</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>&lt;leader&gt; s</code></td>
        <td>Open new horizontal split window</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>&lt;leader&gt; v</code></td>
        <td>Open new vertical split window</td>
    </tr>
    <tr>
        <td nowrap>Insert</td>
        <td nowrap><code>Control+k</code></td>
        <td>Move cursor Up</td>
    </tr>
    <tr>
        <td nowrap>Insert</td>
        <td nowrap><code>Control+j</code></td>
        <td>Move cursor Down</td>
    </tr>
    <tr>
        <td nowrap>Insert</td>
        <td nowrap><code>Control+h</code></td>
        <td>Move cursor Left</td>
    </tr>
    <tr>
        <td nowrap>Insert</td>
        <td nowrap><code>Control+l</code></td>
        <td>Move cursor Right</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>&lt;leader&gt; tn</code></td>
        <td>Open new tab</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>&lt;leader&gt; td</code></td>
        <td>Close tab</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>&lt;leader&gt; th</code></td>
        <td>Go to previous tab</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>&lt;leader&gt; tl</code></td>
        <td>Go to next tab</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>&lt;leader&gt; te</code></td>
        <td>Open new tab with current buffer's path</td>
    </tr>
    <tr>
        <td nowrap>Normal/Visual</td>
        <td nowrap><code>Tab</code></td>
        <td>Indent current line or selection</td>
    </tr>
    <tr>
        <td nowrap>Normal/Visual</td>
        <td nowrap><code>Shift+Tab</code></td>
        <td>De-indent current line or selection</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>&lt;leader&gt; h</code></td>
        <td>Toggle search highlight on/off</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>F5</code></td>
        <td>Strip whitespaces in file</td>
    </tr>
    <tr>
        <td nowrap>Normal/Visual</td>
        <td nowrap><code>ga</code></td>
        <td>Align text with EasyAlign</td>
    </tr>
    <tr>
        <td nowrap>All</td>
        <td nowrap><code>Control+n</code></td>
        <td>Toggle NERDTree File Manager</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>&lt;leader&gt; k</code></td>
        <td>Go to previous syntax error with ALE</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>&lt;leader&gt; j</code></td>
        <td>Go to next syntax error with ALE</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>&lt;leader&gt; ci</code></td>
        <td>Show diagnostic message using COC.nvim</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>&lt;leader&gt; jn</code></td>
        <td>Jump to next diagnostic position using COC.nvim</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>&lt;leader&gt; jp</code></td>
        <td>Jump to previous diagnostic position using COC.nvim</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>&lt;leader&gt; jd</code></td>
        <td>Jump to definition using COC.nvim</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>&lt;leader&gt; jc</code></td>
        <td>Jump to declaration using COC.nvim</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>&lt;leader&gt; ji</code></td>
        <td>Jump to implementation using COC.nvim</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>&lt;leader&gt; jt</code></td>
        <td>Jump to type definition using COC.nvim</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>&lt;leader&gt; jr</code></td>
        <td>Jump to reference using COC.nvim</td>
    </tr>
    <tr>
        <td nowrap>Normal/Visual</td>
        <td nowrap><code>&lt;leader&gt; cf</code></td>
        <td>Format range of word of selection using COC.nvim</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>&lt;leader&gt; cr</code></td>
        <td>Rename symbol using COC.nvim</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>&lt;leader&gt; cl</code></td>
        <td>Open current link using COC.nvim</td>
    </tr>
    <tr>
        <td nowrap>Insert</td>
        <td nowrap><code>Alt+n</code></td>
        <td>Jump to next snippet placeholder using COC Snippets</td>
    </tr>
    <tr>
        <td nowrap>Insert</td>
        <td nowrap><code>Alt+p</code></td>
        <td>Jump to previous snippet placeholder using COC Snippets</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>&lt;leader&gt; ff</code></td>
        <td>Fuzzy file search using FZF</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>&lt;leader&gt; fb</code></td>
        <td>Fuzzy buffer search using FZF</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>&lt;leader&gt; fw</code></td>
        <td>Fuzzy window search using FZF</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>&lt;leader&gt; fl</code></td>
        <td>Fuzzy line search using FZF</td>
    </tr>
    <tr>
        <td nowrap>Normal</td>
        <td nowrap><code>&lt;leader&gt; fh</code></td>
        <td>Fuzzy history search using FZF</td>
    </tr>
</table>

**Tmux**

I override the default keybindings for Tmux to be more reasonable. Prefix key is `Alt+a` for local session and `Alt+z` for nested session. You can of course override this using your custom `.tmux.conf.local` file. `<prefix>` means you need to press prefix key first, `<repeat>` means you don't need to press prefix key again after triggering it within `repeat-time` set (default set to 1 second), `<copy-mode>` means you must be in copy-mode first. The table below lists all the keybindings set. If they are not in the table, that means it is using the default Tmux keybindings.

<table>
    <tr>
        <td nowrap><b>Tmux Keypress</b></td>
        <td><b>Description</b></td>
    </tr>
    <tr>
        <td nowrap><code>&lt;prefix&gt; Alt+e</code></td>
        <td>Edit tmux.conf.local file and reload configuration after saving</td>
    </tr>
    <tr>
        <td nowrap><code>&lt;prefix&gt; Alt+r</code></td>
        <td>Reload tmux configuration</td>
    </tr>
    <tr>
        <td nowrap><code>&lt;prefix&gt; f</code></td>
        <td>Find session, window, pane from a list</td>
    </tr>
    <tr>
        <td nowrap><code>&lt;prefix&gt; Alt+s</code></td>
        <td>Make new horizontal split window</td>
    </tr>
    <tr>
        <td nowrap><code>&lt;prefix&gt; Alt+v</code></td>
        <td>Make new vertical split window</td>
    </tr>
    <tr>
        <td nowrap><code>&lt;prefix&gt; r</code></td>
        <td>Rename current window</td>
    </tr>
        <td nowrap><code>&lt;prefix&gt; R</code></td>
        <td>Rename current session</td>
    </tr>
    </tr>
        <td nowrap><code>&lt;prefix&gt; &lt;repeat&gt; h</code></td>
        <td>Move selection to left pane</td>
    </tr>
    </tr>
        <td nowrap><code>&lt;prefix&gt; &lt;repeat&gt; j</code></td>
        <td>Move selection to pane below</td>
    </tr>
    </tr>
        <td nowrap><code>&lt;prefix&gt; &lt;repeat&gt; k</code></td>
        <td>Move selection to pane above</td>
    </tr>
    </tr>
        <td nowrap><code>&lt;prefix&gt; &lt;repeat&gt; l</code></td>
        <td>Move selection to right pane</td>
    </tr>
    </tr>
        <td nowrap><code>&lt;prefix&gt; &lt;repeat&gt; &gt;</code></td>
        <td>Swap to the next pane</td>
    </tr>
    </tr>
        <td nowrap><code>&lt;prefix&gt; &lt;repeat&gt; &lt;</code></td>
        <td>Swap to the previous pane</td>
    </tr>
    </tr>
        <td nowrap><code>&lt;prefix&gt; &lt;repeat&gt; H</code></td>
        <td>Resize current pane to the left</td>
    </tr>
    </tr>
        <td nowrap><code>&lt;prefix&gt; &lt;repeat&gt; J</code></td>
        <td>Resize current pane downwards</td>
    </tr>
    </tr>
        <td nowrap><code>&lt;prefix&gt; &lt;repeat&gt; K</code></td>
        <td>Resize current pane upwards</td>
    </tr>
    </tr>
        <td nowrap><code>&lt;prefix&gt; &lt;repeat&gt; L</code></td>
        <td>Resize current pane to the right</td>
    </tr>
    </tr>
        <td nowrap><code>&lt;prefix&gt; &lt;repeat&gt; Alt+n</code></td>
        <td>Move selection to the next window</td>
    </tr>
    </tr>
        <td nowrap><code>&lt;prefix&gt; &lt;repeat&gt; Alt+p</code></td>
        <td>Move selection to the previous window</td>
    </tr>
    </tr>
        <td nowrap><code>&lt;prefix&gt; &lt;repeat&gt; Tab</code></td>
        <td>Move selection to the next window</td>
    </tr>
    </tr>
        <td nowrap><code>&lt;prefix&gt; S</code></td>
        <td>Join current pane to selected window in horizontal split</td>
    </tr>
    </tr>
        <td nowrap><code>&lt;prefix&gt; V</code></td>
        <td>Join current pane to selected window in vertical split</td>
    </tr>
    </tr>
        <td nowrap><code>&lt;prefix&gt; x</code></td>
        <td>Close current pane</td>
    </tr>
    </tr>
        <td nowrap><code>&lt;prefix&gt; X</code></td>
        <td>Close current window</td>
    </tr>
    </tr>
        <td nowrap><code>&lt;prefix&gt; Alt+x</code></td>
        <td>Close all other window window</td>
    </tr>
    </tr>
        <td nowrap><code>&lt;prefix&gt; a</code></td>
        <td>Go into copy mode</td>
    </tr>
    </tr>
        <td nowrap><code>&lt;prefix&gt; p</code></td>
        <td>Paste copied text from the last buffer</td>
    </tr>
    </tr>
        <td nowrap><code>&lt;prefix&gt; P</code></td>
        <td>Choose buffer to paste from list</td>
    </tr>
    <tr>
        <td nowrap><code>&lt;copy-mode&gt; y</code></td>
        <td>Copy selected text</td>
    </tr>
    <tr>
        <td nowrap><code>&lt;copy-mode&gt; Y</code></td>
        <td>Copy the whole line of selected text</td>
    </tr>
    <tr>
        <td nowrap><code>&lt;copy-mode&gt; D</code></td>
        <td>Copy untile the end of line from the selected text</td>
    </tr>
</table>

## Customization
**Fish**

To install or remove fish plugins, you can just run `fisher` command. 

To change the included `base16-google-dark` colorscheme, you can type `base16` followed by a tab to perform tab completion.

**Vim**

You can create a new file in your `$HOME` folder call `.vimrc.local` and put in what you want to override in that file.

**Tmux**

You can simply create a new file in your `$HOME` folder call `.tmux.conf.local` and put in what you want to override in that file. After that, source that file in tmux and you are done. You can do it with this keybindings:
- `Alt+a,Alt+e` to edit tmux.conf.local file
- `Alt+a,Alt+r` to re source your tmux
You can also add Tmux plugins into your .tmux.conf.local file normally.

## To do
- [ ] Better way to use custom configs
- [ ] Use separate files instead of one vimrc
- [ ] Create ansible role to automate everything
