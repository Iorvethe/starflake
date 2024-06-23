{
  description = "My pretty little NixOS flake";

  inputs = {
    # NixOS official package source
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    # Hardware configuration
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # Home manager, for user files management
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # TODO: fix firefox addons
    # nur.url = "github:nix-community/NUR";
  };


  outputs = { self, nixpkgs, nixos-hardware, home-manager, ... }@inputs: {
    # Configuration for `pluto` machine
    nixosConfigurations.pluto = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
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

            users.borisp = import ./home.nix;
          };
        }
      ];
    };
  };
}
