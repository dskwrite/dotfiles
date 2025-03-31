# dotfiles

This repo contains my macOS setup and configuration using:

-   [Nix](https://nixos.org)
-   [nix-darwin](https://github.com/LnL7/nix-darwin)
-   [home-manager](https://github.com/nix-community/home-manager)

# Structure

-   `flake.nix`: Defines inputs (Nixpkgs, nix-darwin, home-manager) and the main `darwinConfigurations` entry point. **Note:** The username (`dsk`) is currently hardcoded here.
-   `darwin.nix`: Configures system-level settings using `nix-darwin`, including:
    -   macOS system defaults (Dock, Finder, Trackpad, etc.)
    -   Homebrew integration (manages formulae, casks, and MAS apps)
    -   Installed fonts
    -   Touch ID for sudo
    -   Integration with Home Manager
-   `chezmoi/` directory: Dotfiles managed by `chezmoi`.

# Steps on a new machine

## First steps

1. Grant Full Disk Access to Terminal.app
    - System Preferences > Security & Privacy > Privacy > Full Disk Access > add /Applications/Utilities/Terminal.app
    - this is needed for some nix flake rebuild steps

1. Call `setup_mac.sh` gist
    ```bash
    bash <(curl -sL https://gist.githubusercontent.com/dskwrite/54c44145968b0fdf2501838e3a912ebf/raw/96e0e71b75e7c6e6f8153cbf74e78c484a8bf2c0/setup_mac.sh) "<replace-with-machine-name>"
    ```
    - renames machine
    - installs Homebrew (since nix-darwin doesn't support installing Homebrew)

## Nix

1. Install Nix (using Determinate Systems installer)
    ```
    curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
    ```
    - Provides a better installation experience compared to the official Nix installer. See [Zero to Nix](https://zero-to-nix.com/concepts/nix-installer)

1. Clone this repo with nix shell, as Git isn't installed yet

    ```bash
    # Ensure Nix is available in your shell first (e.g., close and reopen terminal after install)
    nix shell nixpkgs#git --command git clone <your-repo-url> ~/dotfiles
    cd ~/dotfiles
    ```

    - Installs `git` using Nix, so that you can clone the rest of your dotfiles

1. Build and apply the configuration:

    ```bash
    # Apply the configuration (builds and activates)
    darwin-rebuild switch --flake .#default
    ```
    - This command installs all configured packages (Nix, Homebrew, Casks, MAS apps) and applies system/user settings.

1. Restart machine, as certain changes require it

## Manual System Settings steps

1. Grant Full Disk Access to Visual Studio Code
    - System Preferences > Security & Privacy > Privacy > Full Disk Access > add /Applications/Visual\ Studio\ Code.app
1. System Settings
    1. Keyboard
        1. Press 🌐 key to `Do Nothing`
        1. Dictation > Shortcut `Press 🎙️`
    1. Control Center
        1. Clock Options
            1. Announce the time - On
            1. Interval - On the half hour
1. Enable iPhone mirroring
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
    1. Feedbin
    1. Bluesky

# Callouts

-   To install apps via mas, the app must have been installed previously before (on any machine at any time)

# References

-   [NixOS Wiki](https://nixos.wiki/wiki/Main_Page)
-   [nix-darwin Configuration Options](https://daiderd.com/nix-darwin/manual/index.html)
-   [Home Manager Option Search](https://home-manager-options.extranix.com)

# TODO

## App configurations

-   [ ] Set nushell as default shell
    - I need to resolve issues with starting a Ghostty session not finding the nushell configs
-   [ ] Orion configuration
-   [ ] [Karabiner-Elements](https://karabiner-elements.pqrs.org) configuration
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

## Evaulate

-   [ ] cli tldr/cheatsheet
    -   navi?
-   [ ] [OrbStack](https://orbstack.dev) as Docker Desktop replacement
