{ pkgs, ... }:

{
  stylix = {
    enable = true;
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

    polarity = "dark";

    image = ./japanese_background.jpg;

    cursor.package = pkgs.bibata-cursors;
    cursor.name = "Bibata-Modern-Ice";

    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
        name = "JetBrainsMono Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };
      serif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };

      sizes = {
        applications = 11;
        terminal = 11;
        desktop = 11;
        popups = 11;
      };
    };
  };
}

