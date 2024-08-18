{ config, lib, pkgs, ... }:

{
  imports = [
    ./stylix.nix
    ./zsh.nix
    ./hyprland.nix
    ./waybar.nix
    ./kitty.nix
    ./cli.nix
    ./programs
    ./tmux.nix
    ./nvimConf/nvim.nix
  ];

  home = {
    username = "sam";
    homeDirectory = "/home/sam";
    stateVersion = "24.05";
  };

  home.enableNixpkgsReleaseCheck = false;

  programs.home-manager.enable = true;

  hyprland.enable = true;
  cli.enable = true;
  kitty.enable = true;
  tmux.enable = true;
  waybar.enable = true;
  zsh.enable = true;
}
