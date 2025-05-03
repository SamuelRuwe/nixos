{ pkgs, inputs, ... }:
let
  next_vim = inputs.neovim-overlay.packages.x86_64-linux.default;
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
  ];

  home = {
    username = "sam";
    homeDirectory = "/home/sam";
    stateVersion = "24.05";
    packages = [
      (import ../scripts/squirtle.nix { inherit pkgs; })
      (import ../scripts/colors.nix { inherit pkgs; })
      (import ../scripts/rofi-launcher.nix { inherit pkgs; })
      (import ../scripts/tmux-sessionizer.nix { inherit pkgs; })
      next_vim
      pkgs.fzf
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
