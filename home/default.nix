{ config, lib, pkgs, ... }:

{
  imports = [
    # ./emoji.nix
    ./rofi/rofi.nix
    ./rofi/config-emoji.nix
    ./rofi/config-long.nix
    ./dunst.nix
    ./stylix.nix
    ./zsh.nix
    ./hyprland.nix
    ./swaync.nix
    # ./waybar/thirdTheme/waybar.nix
    ./waybar/fourthTheme/waybar.nix
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
    packages = [
      (import ../scripts/squirtle.nix { inherit pkgs; })
      (import ../scripts/rofi-launcher.nix { inherit pkgs; })
    ];
  };

  home.enableNixpkgsReleaseCheck = false;

  programs.home-manager.enable = true;

  dunst.enable = false;
  hyprland.enable = true;
  cli.enable = true;
  kitty.enable = true;
  tmux.enable = true;
  waybar.enable = true;
  zsh.enable = true;
}
