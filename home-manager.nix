{ config, pkgs, username, ... }: {

  home.stateVersion = "24.05";
  home.packages = with pkgs; [
    atuin
    bat
    bicep
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
    zoxide
  ];

  home.file = {
    ".gitconfig".source = ./git/.gitconfig;
    ".config/ghostty/config".source = ./ghostty/config;
    ".config/nushell/config.nu".source = ./nushell/config.nu;
    ".config/nushell/env.nu".source = ./nushell/env.nu;
    ".config/powershell/Microsoft.PowerShell_profile.ps1".source = ./pwsh/profile.ps1;
    ".config/starship.toml".source = ./starship/starship.toml;
    ".config/Windsurf/User/settings.json".source = ./windsurf/settings.json;
    "/Library/Application Support/tealdeer/config.toml".source = ./tealdeer/config.toml;
    ".zshrc".source = ./zsh/.zshrc;
    ".bashrc".source = ./bash/.bashrc;
  };

  programs = {
    home-manager.enable = true;
  };


}
