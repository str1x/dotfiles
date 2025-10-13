{
  description = "PepeOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-nvim.url = "github:str1x/nix-nvim";
  };

  outputs = { nixpkgs, home-manager, nix-nvim, ... } @ inputs: {
   nixosConfigurations.PepeOS = nixpkgs.lib.nixosSystem {
     modules = [
       nix-nvim.nixosModules.default
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
