{
  description = "Sam's NixOS Config";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    stylix.url = "github:danth/stylix";

    neovim-overlay = {
      url = "github:SamuelRuwe/neovim-flake";
    };

    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
  };

  outputs = { self, nixpkgs, home-manager, stylix, neovim-overlay, ... }@inputs: 
    let
      homeManagerConf = {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.sam = import ./home;
        home-manager.backupFileExtension = "backup";
        home-manager.extraSpecialArgs = { inherit inputs; };
      };

      coreHomeManagerModules = [
        ./hosts/sam/stylix.nix
        stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager homeManagerConf
      ];
    in
    {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = coreHomeManagerModules ++ [
          ./hosts/sam/desktop/configuration.nix
        ];
      };
      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = coreHomeManagerModules ++ [
          ./hosts/sam/laptop/configuration.nix
        ];
      };
    };
  };
}
