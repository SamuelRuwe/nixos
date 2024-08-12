{ config, lib, pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./hyprland.nix
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

  home.packages = [
    (pkgs.nerdfonts.override { fonts = [ "DroidSansMono" ]; })
  ];

  home.enableNixpkgsReleaseCheck = false;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  hyprland.enable = true;
  cli.enable = true;
  kitty.enable = true;
  tmux.enable = true;
  zsh.enable = true;
}
