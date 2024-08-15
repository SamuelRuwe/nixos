{ config, pkgs, lib, ... }:
{

  options = {
    hyprland.enable = lib.mkEnableOption "Enables hyprland config";
  };

  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      settings = {
       "$mod" = "SUPER";

        env = [
          "XCURSOR_SIZE,24"
        ];

       # general = {
       #    gaps_in = 5;
       #    gaps_out = 10;
       #    border_size = 2;
       #    "col.active_border" = "rgba(${config.stylix.base16Scheme.base0E}ff) rgba(${config.stylix.base16Scheme.base09}ff) 60deg";
       #    "col.inactive_border" = "rgba(${config.stylix.base16Scheme.base00}ff)";
       #    layout = "dwindle";
       # };

      exec-once = [

        "swww-daemon &"
        "waybar &"
        "dunst"
        # "swww img ~/Downloads/nixos-chan.png"
        # "waybar"
      ];

       bind =
          [
            "$mod, Q, exec, kitty"
            "$mod, F, exec, firefox"
            "$mod, S, exec, rofi -show drun -show-icons"
          ]
          ++ (
            # workspaces
            # binds $mod + [shift +] {..10} to [move to] workspace {1..10}
            builtins.concatLists (builtins.genList (
                x: let
                  ws = let
                    c = (x + 1) / 10;
                  in
                    builtins.toString (x + 1 - (c * 10));
                in [
                  "$mod, ${ws}, workspace, ${toString (x + 1)}"
                  "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
                ]
              )
              10)
          );
        };
    };

    home.packages = with pkgs; [
      wl-clipboard
      swww
      rofi-wayland
      dunst
      libnotify
      waybar
    ];
  };
}
