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
        };

       "$mod" = "SUPER";

        env = [
          "XCURSOR_SIZE,24"
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
      wl-clipboard
      swww
      rofi-wayland
      dunst
      networkmanagerapplet
    ];
  };
}
