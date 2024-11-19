# dotfiles

My macOS setup and configuration using:

-   [Nix](https://nixos.org)
-   [nix-darwin](https://github.com/LnL7/nix-darwin)
-   [home-manager](https://github.com/nix-community/home-manager)

# Steps on a new machine

## First steps

1. Grant Full Disk Access to Terminal.app
    - this is needed for some nix flake rebuild steps
1. Call `setup_mac.sh` gist
    ```zsh
    zsh <(curl -sL https://gist.githubusercontent.com/dskwrite/54c44145968b0fdf2501838e3a912ebf/raw/96e0e71b75e7c6e6f8153cbf74e78c484a8bf2c0/setup_mac.sh) "<replace-with-machine-name>"
    ```
    - renames machine
    - installs Homebrew (since nix-darwin doesn't support installing Homebrew)

## Nix

1. install Nix (using Determinate Systems installer)
    ```
    curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
    ```
    - Provides a better installation experience compared to the official Nix installer. See [Zero to Nix](https://zero-to-nix.com/concepts/nix-installer)
1. Clone this repo with nix shell, as Git isn't installed yet

    ```

    ```

1. Build ...

    ```

    ```

1. Restart machine, as certain changes require it

## Manual System Settings steps

1. Grant Full Disk Access to Visual Studio Code
1. Turn off Spotlight keyboard shortcut

## Manual steps for apps

1. Launch Safari
    1. Set default search engine
1. Launch 1Password
1. Launch Raycast
    1. Log in to sync settings
1. Launch Perplexity
    1. map hotkey to superkey + p
1. Launch Arc
    1. Sign in
    1. Sync sidebar
    1. Automatically update my Arc
    1. Change search engine to Perplexity
1. Launch AltTab
    1. Change hotkey to `⌘` + `TAB`

# Callouts

-   To install apps via mas, the app must have been installed previously before (on any machine at any time)

# References

-   [NixOS Wiki](https://nixos.wiki/wiki/Main_Page)
-   [nix-darwin Configuration Options](https://daiderd.com/nix-darwin/manual/index.html)
-   [Home Manager Option Search](https://home-manager-options.extranix.com)

# TODO

## App configurations

-   [ ] [Karabiner-Elements](https://karabiner-elements.pqrs.org) configuration
-   [ ] bash configuration
-   [ ] troubleshoot installing azure-cli with home-manager
-   currently installing with homebrew
-   [ ] determine how to manage PowerShell modules
-   [ ] Uninstall unwanted default apps, e.g., Notes
-   [ ] Set default apps for file types
-   [ ] Self host Atuin sync

## System configurations

-   [ ] disable default macOS hotkeys (see https://github.com/franckrasolo/dotfiles.nix/blob/trunk/darwin/macOS/keyboard.nix)
    -   Spotlight
    -   screenshots
-   [ ] Hide Wi-Fi in menu bar
-   [ ] Hide Spotlight in menu bar
-   [ ] Hide Siri in menu bar

## Nix

-   [ ] remove hardcoded user
