{
  description = "Stellar NixOS flake configuration";

  inputs = {
    # NixOS official package source
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    # Hardware configuration
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # User files management
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # KDE Plasma configuration
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      # url = "path:/home/borisp/Dev/oss/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    # TODO: fix firefox addons
    # nur.url = "github:nix-community/NUR";
  };

  outputs = { self, nixpkgs, nixos-hardware, home-manager, plasma-manager, ... }@inputs:
  let
    username = "borisp";
    system = "x86_64-linux";
  in
  {
    # Configuration for `saturn` machine
    nixosConfigurations.saturn = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        # Hardware configuration
        nixos-hardware.nixosModules.lenovo-legion-15arh05h

        # Import the system configuration.nix
        ./configuration.nix

        # Configure home-manager
        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

            sharedModules = [
              plasma-manager.homeManagerModules.plasma-manager
            ];

            users."${username}" = import ./home.nix;
          };
        }
      ];
    };
  };
}
