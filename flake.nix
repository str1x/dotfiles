{
  description = "PepeOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-nvim.url = "github:str1x/nix-nvim";
    entropy.url = "github:ergohaven/entropy/v0.4.0";
  };

  outputs = { nixpkgs, home-manager, nix-nvim, entropy, ... } @ inputs: {
    nixosConfigurations.PepeOS = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nix-nvim.nixosModules.default
        entropy.nixosModules.default
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.pepe = import ./home;
        }
      ];
    };
  };
}
