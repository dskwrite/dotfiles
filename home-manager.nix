{ config, pkgs, username, ... }: {

  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    #atuin
    #bat
    #bicep
    ##bun
    #carapace
    #cheat
    ##chezmoi
    ##deno
    #duckdb
    #fastfetch
    #fzf
    #gh
    #git
    #git-credential-manager
    #lazygit
    #navi
    #nushell
    #pet
    ##pnpm
    #powershell
    #python3
    ##sqlite
    #starship
    #stow
    #tealdeer
    #tmpmail
    #uv
    #zoxide
  ];


  # Why do I use stow instead of `programs.$pkg.configuration`?
  # - The apps themselves need to make changes to the configuration files
  # - Easier to iterate on changes by seeing them made directly without rebuilding the flake
  # - Nix configurations may not be up to date or comprehensive.
  # - Better editor support for configuration files with native syntax.
  # - Easier to find examples of native configuration files/syntax.

#  home.activation.stowDots = ''
#    # Construct paths relative to the home directory
#    TARGET_DIR="${config.home.homeDirectory}" # home directory, e.g., /Users/dsk
#    STOW_DIR="$TARGET_DIR/dotfiles/stow" # stow directory, e.g., /Users/dsk/dotfiles/stow
#
#    # Ensure stow package is available
#    STOW_BIN="${pkgs.stow}/bin/stow" 
#
#    if [ -d "$STOW_DIR" ]; then
#      echo "Running stow for packages in $STOW_DIR targeting $TARGET_DIR..."
#      # Use -R (restow) to handle updates gracefully. 
#      # -d specifies the directory containing the stow packages
#      # -t specifies the target directory
#      # The final arguments are the packages to stow (we use find to get all dirs)
#      PACKAGES=$(find "$STOW_DIR" -maxdepth 1 -mindepth 1 -type d -exec basename {} \;)
#      if [ -n "$PACKAGES" ]; then
#        echo "Stowing packages: $PACKAGES"
#        $STOW_BIN -d "$STOW_DIR" -t "$TARGET_DIR" -R $PACKAGES
#      else
#        echo "No packages found in $STOW_DIR to stow."
#      fi
#      echo "Stow complete."
#    else
#      echo "Stow directory $STOW_DIR not found, skipping stow."
#    fi
#  '';

}