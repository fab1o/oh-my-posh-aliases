# @fab1o/oh-my-posh-aliases

## Complete Setup

1. Install iTerm2

- (optional) Turn "Show mark indicators" off to hide the arrow in each prompt. Go to Settings > Profiles > Terminal > unselect "Show mark indicators"
- (optional) Go to Settings > Profiles > Colors > Color Presents.. This theme uses [Gruvbox](https://github.com/herrbischoff/iterm2-gruvbox) palette.

2. Install oh-my-zsh

- Use default configuration.
- (optional) Follow the step below if you use Homebrew and you have Homebrew set to PATH in `.zfab1o`:
  - Add Homebrew to PATH in your `~/.zshrc` instead, make sure that's the correct path to Homebrew:
    ```sh
    export PATH="$PATH:/opt/homebrew/bin"
    ```

3. Install oh-my-posh

- Follow instructions and the standard recommendations in Oh My Posh's guide.
- Install a font and configure iTerm2, [docs](https://iterm2.com/documentation-fonts.html).
  - Go to Settings > Profiles > Text > Font

4. Download the [latest version](https://github.com/fab1o/oh-my-posh-aliases/releases) or copy the contents of [`src`](src/) to your home folder: `~/`

5. Configure oh-my-posh in your `~/.zshrc` to use theme:
```sh
source "$HOME/.zfab1o"
eval "$(oh-my-posh init zsh --config ~/fab1o.omp.json)"
```

6. Tailor your settings within `~/.zfab1ocfg`

7. Restart your terminal or type `refresh`.