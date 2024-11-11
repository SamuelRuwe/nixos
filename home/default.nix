{ config, lib, pkgs, stdenv, fetchzip, ... }:
let
  nvim_derivations = import ./neovim/nvim_derivations.nix { inherit pkgs; };
in
{
  imports = [
    ./emoji.nix
    ./rofi/rofi.nix
    ./rofi/config-emoji.nix
    ./rofi/config-long.nix
    ./dunst.nix
    ./stylix.nix
    ./zsh.nix
    ./hyprland.nix
    ./waybar.nix
    ./kitty.nix
    ./cli.nix
    ./programs
    ./tmux.nix
    # ./nvimConf/nvim.nix
    ./nvimConf/other_vim.nix
  ];

  home = {
    username = "sam";
    homeDirectory = "/home/sam";
    stateVersion = "24.05";
    packages = [
      (import ../scripts/squirtle.nix { inherit pkgs; })
      (import ../scripts/rofi-launcher.nix { inherit pkgs; })
      nvim_derivations.nvim2
      # nvim_derivations.nvim3
    ];
  };

  home.enableNixpkgsReleaseCheck = false;

  programs.home-manager.enable = true;

  dunst.enable = true;
  hyprland.enable = true;
  cli.enable = true;
  kitty.enable = true;
  tmux.enable = true;
  waybar.enable = true;
  zsh.enable = true;

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };
}
