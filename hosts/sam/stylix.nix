{ pkgs, ... }:

{
  stylix = {
    enable = true;
    polarity = "dark";
    image = ./japanese_background.jpg;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    fonts = {
      monospace = {
        # package = pkgs.nerd-fonts.jetbrains-mono;
        # name = "JetBrainsMono Nerd Font Mono";
        # package = pkgs.nerd-fonts.iosevka;
        # name = "Iosevka Nerd Font Mono";
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font Mono";
        # package = pkgs.nerd-fonts.cutive-mono;
        # name = "Cutive Mono";
        # package = pkgs.nerd-fonts.inconsolata;
        # name = "Inconsolata Nerd Font";
      };
    };
  };
}

