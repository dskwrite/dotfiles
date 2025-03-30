{ config, pkgs, username, ... }: {

  home.stateVersion = "24.05";
  home.packages = with pkgs; [
    atuin
    bat
    bicep
    #bun
    carapace
    cheat
    chezmoi
    #deno
    duckdb
    fastfetch
    fzf
    gh
    git
    git-credential-manager
    lazygit
    navi
    nushell
    pet
    #pnpm
    powershell
    python3
    #sqlite
    starship
    tealdeer
    tmpmail
    uv
    zoxide
  ];
  
  # `home.file` is used to create files in the user's home directory,
  # by pointing to files in the Nix store.
  # This is necessary because Nix won't actually create the files,
  # it just creates a symlink to the file in the store.

  # Why do I use `home.file` instead of `programs.$pkg.configuration`?
  # 1. Nix configurations may not be up to date or comprehensive.
  # 2. Better editor support for configuration files with native syntax.
  # 3. Easier to find examples of native configuration files/syntax.
  
  home.file = {
    
    # shells
    ".bashrc".source = ./bash/.bashrc;
    ".config/nushell/config.nu".source = ./nushell/config.nu;
    ".config/nushell/env.nu".source = ./nushell/env.nu;
    ".config/powershell/Microsoft.PowerShell_profile.ps1".source = ./pwsh/profile.ps1;
    ".zshrc".source = ./zsh/.zshrc;

    # git
    ".gitconfig".source = ./git/.gitconfig;

    # CLI tools
    ".config/atuin/config.toml".source = ./atuin/config.toml;
    ".config/starship.toml".source = ./starship/starship.toml;
    "/Library/Application Support/tealdeer/config.toml".source = ./tealdeer/config.toml;

    # ghostty
    ".config/ghostty/config".source = ./ghostty/config;

  };

  programs = {
    home-manager.enable = true;

    chezmoi = {
        enable = true;
        settings = {
          # Tell chezmoi that the source files are in the 'home' subdirectory
          # within your main dotfiles repository. Adjust if you choose a different name.
          sourceDir = "${config.home.homeDirectory}/dotfiles/home";

          # Optional: Configure diff and edit tools
          #diff = {
          #  command = "git";
          #  args = ["diff", "--no-index", "--"];
          #};
          #edit = {
          #   command = "code"; # Or vim, nano, etc.
          #};
          # Optional: Automatically commit after successful `chezmoi apply`
          # autoCommit = true;
        };
    };

  };


}
