# @fab1o/oh-my-posh-aliases

This repository contains:
- Oh My Posh Theme
- Oh My Zch Aliases and Functions

This theme is loosely based on [robbyrussell](https://ohmyposh.dev/docs/themes#robbyrussell) oh-my-posh's theme and a configurable set of aliases and functions to pump your Z (zsh) shell. This theme fixes an [issue](https://github.com/JanDeDobbeleer/oh-my-posh/issues/6204) with the robbyrussell's theme where the "✗" was incorrectly configured in the oh-my-posh version of robbyrussell's [original](https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/robbyrussell.zsh-theme#L6) Oh My Zsh's theme.

## Oh My Posh Theme

Source here: [fabiocosta.omp.json](src/fabiocosta.omp.json). Follow the Setup process below.

![theme screenshot](doc/theme.png)

## Aliases + Functions

Source here: [.zprofile](src/.zprofile) and [.zprofile_config](src/.zprofile_config). Follow the Setup process below.

The Aliases and Functions can be used with Oh My Zch only, or in combination with Oh My Posh.

After setup, type `help` to print this little helpful resource:

![terminal help screenshot](doc/terminal_help.png)

## Requirements

- (required) [iTerm2](https://iterm2.com/)
- (required) [oh-my-zsh](https://ohmyz.sh/)
- (required) [oh-my-posh](https://ohmyposh.dev/)
- (optional) This theme uses [Gruvbox](https://github.com/herrbischoff/iterm2-gruvbox) palette, you can edit it.

## Setup

### Get Started

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

4. Download the [latest version](https://github.com/fab1o/oh-my-posh-aliases/releases) or copy the contents of [`src`](src/) to your home folder: `~/`
5. Configure oh-my-posh in your `~/.zshrc` to use theme:

```sh
eval "$(oh-my-posh init zsh --config ~/fabiocosta.omp.json)"
```

6. Tailor your settings within `~/.zprofile_config`

7. Restart your terminal

## Configuration

Tailor your settings within `~/.zprofile_config` and restart or run `refresh` command to refresh your terminal.

## Upgrade

Considering upgrading if the version in your `.zprofile` is outdated. The version is written on the 1st line of each file.

1. Go to the [latest release](https://github.com/fab1o/oh-my-posh-aliases/releases), download the zip and unzip.

2. Check if the version on top of your own `~/.zprofile_config` file is also outdaded. If it is then copy the new configuration values from the unzipped file to your own `~/.zprofile_config` file.

3. Replace the files in your home folder (`~/`) with the new version (the unzipped files):
- `/oh-my-posh-aliases/src/.zprofile`
- `/oh-my-posh-aliases/src/fabiocosta.omp.json`

(do not replace `~/.zprofile_config` because you don't want your configuration values replaced)

4. Refresh your terminal (or restart if you're experiencing issues)
