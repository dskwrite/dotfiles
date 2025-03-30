# A "flake" is a source tree with a single file named `flake.nix` at its root.
# It's a way to describe a package or a set of packages, as well as a way to
# describe the dependencies of those packages. Flakes are used to define
# reproducible and composable builds. They are used by the Nix package manager
# to build and manage packages.

{
  description = "macOS nix-darwin configuration";

  # `inputs` is a mapping of flake references that are used as dependencies
  # by the flake that this file defines. They are used to fetch the latest
  # version of the referenced flake and its outputs.
  # See:
  # - https://nixos.org/manual/nixpkgs/stable/#sec-flakes
  # - https://github.com/LnL7/nix-darwin
  # - https://github.com/nix-community/home-manager
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable"; # flake that manages nix packages
    nix-darwin.url = "github:LnL7/nix-darwin"; # flake that manages macOS systems
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs"; # dependency of nix-darwin
    home-manager.url = "github:nix-community/home-manager"; # flake that manages home directories
    home-manager.inputs.nixpkgs.follows = "nixpkgs"; # dependency of home-manager
  };

  # `outputs` is a mapping of flake outputs that are available to other flakes.
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
        ];
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."default".pkgs;
    };

}
