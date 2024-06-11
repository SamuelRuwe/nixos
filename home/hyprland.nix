{config, pkgs, ... }:
{
  # wayland.windowManager.hyprland = {
    # enable = true;
    # package = pkgs.hyprland;
    # xwayland.enable = true;
    # settings = {
     #   "$mod" = "SUPER";
    # };
  # };

#  home.pointerCursor = {
#      gtk.enable = true;
#      package = pkgs.bibata-cursors;
#      name = "Bibata-Modern-Classic";
#      size = 16;
#  };
#
#  gtk = {
#      enable = true;
#  };

   home.file.".icons/default".source = "${pkgs.vanilla-dmz}/share/icons/Vanilla-DMZ";
}
