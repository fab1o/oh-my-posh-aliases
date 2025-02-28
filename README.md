# @fab1o/oh-my-posh-aliases

Oh My Posh's Theme + Aliases + Functions

Loosely based on [robbyrussell](https://ohmyposh.dev/docs/themes#robbyrussell) oh-my-posh's theme and a configurable set of aliases and functions to pump your Z (zsh) shell.

This theme fixes an [issue](https://github.com/JanDeDobbeleer/oh-my-posh/issues/6204) with the robbyrussell's theme where the "✗" was incorrectly configured in the oh-my-posh version of robbyrussell's [original](https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/robbyrussell.zsh-theme#L6) Oh My Zsh's theme.

## Aliases + Functions

Support for **Z shell (Zsh) only**. Type `help` to print documentation below:

![screenshot](docs/screenshot.png)

## Requirements

- (required) [iTerm2](https://iterm2.com/)
- (required) [oh-my-zsh](https://ohmyz.sh/)
- (required) [oh-my-posh](https://ohmyposh.dev/)
- (optional) This theme uses [Gruvbox](https://github.com/herrbischoff/iterm2-gruvbox) palette, you can edit it.

## Setup

1. Install iTerm2

- (optional) Turn "Show mark indicators" off to hide the arrow in each prompt. Go to Settings > Profiles > Terminal > unselect "Show mark indicators"
- (optional) Go to Settings > Profiles > Colors > Color Presents.. This theme uses [Gruvbox](https://github.com/herrbischoff/iterm2-gruvbox) palette.

2. Install oh-my-zsh

- Use default configuration.
- (optional) Follow the step below if you use Homebrew and you have Homebrew set to PATH in `.zprofile`:
  - Add Homebrew to PATH in your `~/.zshrc` instead, make sure that's the correct path to Homebrew:
    ```sh
    export PATH="$PATH:/opt/homebrew/bin"
    ```

3. Install oh-my-posh

- Follow instructions and the standard recommendations in Oh My Posh's guide.
- Install a font and configure iTerm2, [docs](https://iterm2.com/documentation-fonts.html).
  - Go to Settings > Profiles > Text > Font

4. Copy the contents of [`src`](src/) to your home folder: `~/`
5. Configure oh-my-posh in your `~/.zshrc` to use theme:

```sh
eval "$(oh-my-posh init zsh --config ~/fabiocosta.omp.json)"
```

6. Restart your terminal

## Configuration

Tailor your settings within `~/.zprofile_config`
