{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    helix.url = "github:helix-editor/helix";

    kmonad = { 
      url = "github:kmonad/kmonad?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, helix, ... }: {
    nixosConfigurations = {
      ideapad = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ 
          ./system
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.not-leader = ./home;
              extraSpecialArgs = {inherit helix; };
            };
          }
        ];
      };
    };
  };
}
