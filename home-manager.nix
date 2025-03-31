# NOT CURRENTLY USING HOME-MANAGER
# I may revisit this but it became to cumbersome to use so I'm using brew and chezmoi instead

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

}