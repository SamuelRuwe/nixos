{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/sam/configuration.nix
        inputs.home-manager.nixosModules.default
	./modulebundle.nix
	{
	  home-manager.useUserPackages = true;
	  home-manager.users.sam = import ./hosts/sam/home.nix;
	}
      ];
    };
  };
}
