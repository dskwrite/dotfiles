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

## Manual steps for apps (until it can be automated)

1. System Settings
    1. Keyboard
        1. Press 🌐 key to `Do Nothing`
        1. Dictation > Shortcut `Press 🎙️`
1. Launch Safari
    1. Tab layout: Compact
    1. Always show website title in tabs
    1. Set default search engine
1. Launch 1Password
    1. Sign in
    1. Enable 1Password cli
1. Launch Raycast
    1. Sign in to sync settings
1. Launch Perplexity
    1. map hotkey to superkey + p
1. Launch Arc
    1. Sign in
    1. Sync sidebar
    1. Automatically update my Arc
    1. Change search engine to Perplexity
    1. Archive tabs after `30 days`
1. Launch Velja
    1. Create rules
        1. Links from Teams open in Edge
        2. Links from Notion open in Edge
1. Create Safari PWAs
    1. Workflowy
    1. Feedbin
    1. Bluesky
1. Enable iPhone mirroring

# Callouts

-   To install apps via mas, the app must have been installed previously before (on any machine at any time)

# References

-   [NixOS Wiki](https://nixos.wiki/wiki/Main_Page)
-   [nix-darwin Configuration Options](https://daiderd.com/nix-darwin/manual/index.html)
-   [Home Manager Option Search](https://home-manager-options.extranix.com)

# TODO

## App configurations

-   [ ] Set nushell as default shell
-   [ ] Orion configuration
-   [ ] [Karabiner-Elements](https://karabiner-elements.pqrs.org) configuration
-   [ ] troubleshoot installing azure-cli with home-manager
    -   currently installing with homebrew
-   [ ] determine how to manage PowerShell modules
-   [ ] how to manage global python packages, e.g., Harlequin
    -   currently using `uv install tool`
-   [ ] Uninstall unwanted default apps, e.g., Notes
    -   '/Applications/GarageBand.app'
    -   '/Applications/iMovie.app'
    -   '/Applications/Keynote.app'
    -   '/Applications/Numbers.app'
    -   '/Applications/Pages.app'
-   [ ] Set default apps for file types
-   [ ] Self host Atuin sync

## System configurations

-   [ ] Hide Wi-Fi in menu bar
-   [ ] Hide Spotlight in menu bar
-   [ ] Hide Siri in menu bar

## Nix

-   [ ] remove hardcoded user

## Evaulate

-   [ ] cli tldr/cheatsheet
    -   navi?
-   [ ] [OrbStack](https://orbstack.dev) as Docker Desktop replacement
