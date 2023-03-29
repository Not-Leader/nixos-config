{
  description = "A very basic flake";
  nixConfig = {
    substituters = [
      "https://cache.nixos.org"
      "https://helix.cachix.org"
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    helix.url = "github:helix-editor/helix";
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    helix,
    ...
  }: {
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
              extraSpecialArgs = {inherit helix;};
            };
          }
        ];
      };
    };
  };
}
