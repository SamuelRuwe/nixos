{
  description = "Sam's NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/sam/configuration.nix
        ./home/stylix.nix
        stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        {
	      home-manager.useUserPackages = true;
	      home-manager.users.sam = import ./home;
              home-manager.backupFileExtension = "backup";
	}
      ];
    };
  };
}
