{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
    let
      # Define the primary username here
      username = "dsk";
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#default
      darwinConfigurations."default" = nix-darwin.lib.darwinSystem {
        # Pass username to modules
        specialArgs = { inherit inputs username; };
        modules = [
          ./darwin.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            # Use the username variable here and pass config/pkgs/username to the import
            home-manager.users.${username} = { config, pkgs, ... }: import ./home-manager.nix { inherit pkgs config username; };
          }
        ];
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."default".pkgs;
    };

}
