{ config, pkgs, ... }:

{
  imports = [
    ./kitty.nix
    # ./hyprland.nix
    ./cli.nix
  ];

  home = {
    username = "sam";
    homeDirectory = "/home/sam";
    stateVersion = "24.05";
  };

  home.packages = [
    pkgs.nerdfonts
  ];

  home.enableNixpkgsReleaseCheck = false;

  # Let Home Manager install and manage itself.
  # programs.home-manager.enable = true;

  programs.zsh = {
      enable = true;
      zplug = {
        enable = true;
        plugins = [
          { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
          { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; } # Installations with additional options. For the list of options, please refer to Zplug README.
        ];
      };
      shellAliases = {
          ll = "ls -l";
	      update = "sudo nixos-rebuild switch --flake '.#default'";
          cl = "clear";
      };
  };
}
