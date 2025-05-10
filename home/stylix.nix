{ pkgs, lib, ... }:

{
  stylix.targets.waybar.enable = false;
  stylix.targets.rofi.enable = false;
  stylix.targets.hyprland.enable = false;
  stylix.targets.dunst.enable = false;
  stylix.targets.kitty.enable = true;
  stylix.targets.neovim.enable = true;
  stylix.autoEnable = true;
}
