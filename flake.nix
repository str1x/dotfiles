{
  description = "PepeOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # obsidian-nvim.url = "github:epwalsh/obsidian.nvim";
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
      # inputs.obsidian-nvim.follows = "obsidian-nvim"; # <- this will use the obsidian-nvim from your inputs
    };

  };

  outputs = { nixpkgs, home-manager, nvf, ... } @ inputs: {
   nixosConfigurations.PepeOS = nixpkgs.lib.nixosSystem {
     modules = [
     	nvf.nixosModules.default
       ./configuration.nix
     ];
   };

   homeComfigurations.pepe = home-manager.lib.homeManagerConfiguration {
     modules = [ ./home ];
   };
  };
}
