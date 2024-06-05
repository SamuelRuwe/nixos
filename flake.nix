{
  description = "Sam's NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/sam/configuration.nix
	    ./modulebundle.nix
        home-manager.nixosModules.home-manager
        {
	      home-manager.useUserPackages = true;
	      home-manager.users.sam = import ./hosts/sam/home.nix;
	    }
      ];
    };
  };
}
