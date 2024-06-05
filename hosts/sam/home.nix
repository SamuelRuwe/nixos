{ config, pkgs, ... }:

{
  imports = [
    # ./hyprland.nix
    ./kitty.nix
    ./cli.nix
  ];

  home = {
    username = "sam";
    homeDirectory = "/home/sam";
    stateVersion = "24.05";
  };

  home.packages = [
    (pkgs.nerdfonts.override { fonts = [ "DroidSansMono" ]; })
  ];

  home.enableNixpkgsReleaseCheck = false;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.zsh = {
      enable = true;
      zplug = {
        enable = true;
        plugins = [
          { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
        ];
      };
      shellAliases = {
          ll = "ls -l";
	      update = "sudo nixos-rebuild switch --flake '.#default'";
          cl = "clear";
      };
  };
}
