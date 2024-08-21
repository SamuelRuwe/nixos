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
        general = {
          gaps_in = 5;
          gaps_out = 10;
          border_size = 2;
          layout = "dwindle";
          resize_on_border = true;
          "col.active_border" = lib.mkForce "rgba(${config.stylix.base16Scheme.base0E}ff) rgba(${config.stylix.base16Scheme.base09}ff) 60deg";
          "col.inactive_border" = lib.mkForce "rgba(${config.stylix.base16Scheme.base00}ff)";
        };

        "$mod" = "SUPER";

        env = [
          "XCURSOR_SIZE,24"
          "NIXPKGS_ALLOW_UNFREE, 1"
          "XDG_CURRENT_DESKTOP, Hyprland"
          "XDG_SESSION_TYPE, wayland"
          "XDG_SESSION_DESKTOP, Hyprland"
          "GDK_BACKEND, wayland, x11"
          "CLUTTER_BACKEND, wayland"
          "QT_QPA_PLATFORM=wayland;xcb"
          "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
          "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
          "SDL_VIDEODRIVER, x11"
          "MOZ_ENABLE_WAYLAND, 1"
        ];

        input = {
          kb_layout = "us";
          kb_rules = "";
          follow_mouse = 1;
          force_no_accel = true;
          sensitivity = 0.0;
        };

        animations = {
          enabled = true;
        };

        exec-once = [
          "swww-daemon &"
          "${pkgs.networkmanagerapplet}/bin/nm-applet --indicator &"
          "swww img ~/Downloads/nixos_chan.png"
          "killall -q swaync;sleep .5 && swaync"
          "killall -q waybar;sleep .5 && waybar"
          "dunst"
        ];

        bind =
           [
             "$mod, T, exec, kitty"
             "$mod, Q, killactive,"
             "$mod, F, exec, firefox"
             # "$mod, left, movefocus, l"
             # "$mod, right, movefocus, r"
             "$mod, S, exec, rofi -show drun -show-icons"
             "$mod, Tab, cyclenext,"
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
      grim
      slurp
      wl-clipboard
      swww
      libnotify
      wlogout
    ];

    home.sessionVariables = {
      QT_QPA_PLATFORM = "wayland";
      SDL_VIDEODRIVER = "wayland";
      XDG_SESSION_TYPE = "wayland";
    };
  };
}
