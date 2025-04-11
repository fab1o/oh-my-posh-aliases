# @fab1o/oh-my-posh-aliases

## Complete Setup

1. Install iTerm2

- https://iterm2.com/

Then:
- Turn "Show mark indicators" off to hide the arrow in each prompt. Go to Settings > Profiles > Terminal > unselect "Show mark indicators"
- Go to Settings > Profiles > Colors > Color Presents.. This theme uses [Gruvbox](https://github.com/herrbischoff/iterm2-gruvbox) palette.

2. Install oh-my-posh

- Follow instructions in Oh My Posh's guide.
- Install Nerd fonts and configure iTerm2, [docs](https://iterm2.com/documentation-fonts.html).
  - Go to Settings > Profiles > Text > Font

3. Install gum

- https://github.com/charmbracelet/gum?tab=readme-ov-file#installation

4. Download the [latest source code zip](https://github.com/fab1o/oh-my-posh-aliases/releases)

5. Copy the contents of [`src`](src/) to your home folder: `~/`

```sh
unzip ~/Downloads/oh-my-posh-aliases-2.0.0.zip "oh-my-posh-aliases-2.0.0/src/*" -d temp_dir
cp -R temp_dir/oh-my-posh-aliases-2.0.0/src/. ~/
rm -rf temp_dir
```

6. Configure oh-my-posh in your `~/.zshrc` to use theme:

```sh
source "$HOME/.fab1o/functions/.zfab1o"
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ~/.fab1o/fab1o.omp.json)"
fi
```

7. Tailor your settings within `~/.fab1o/config/.zfab1ocfg`.
  - Type `help` for help

8. Restart your terminal.
