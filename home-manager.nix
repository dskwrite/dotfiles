{ pkgs, ... }: {

  home.stateVersion = "24.05";
  home.packages = with pkgs; [
    atuin
    bat
    #bun
    carapace
    cheat
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
    wezterm
    zoxide
  ];

  home.file = {
    ".gitconfig".source = ./git/.gitconfig;
    ".config/nushell/config.nu".source = ./nushell/config.nu;
    ".config/nushell/env.nu".source = ./nushell/env.nu;
    ".config/powershell/Microsoft.PowerShell_profile.ps1".source = ./pwsh/profile.ps1;
    ".config/starship.toml".source = ./starship/starship.toml;
    ".config/wezterm/wezterm.lua".source = ./wezterm/wezterm.lua;
    "/Library/Application Support/tealdeer/config.toml".source = ./tealdeer/config.toml;
  };

  programs = {
    home-manager.enable = true;

    atuin = {
      enable = true;
      enableZshIntegration = true;
    };

    carapace = {
      enable = true;
      enableZshIntegration = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      initExtra = ''
        eval "$(/opt/homebrew/bin/brew shellenv)"
        eval "$(starship init zsh)"
        eval "$(zoxide init --cmd cd zsh)"
      '';
    };

  };


}
