{ config, pkgs, lib, ... }:
{

  options = {
    waybar.enable = lib.mkEnableOption "Enables waybar config";
  };

  config = lib.mkIf config.waybar.enable {
    programs.waybar = {
      enable = true;
      systemd.enable = true;
      style = ./waybar.css;
      settings = {
        mainBar = {
          layer = "top";
          position = "bottom";
          height = 35;
          margin-top = 5;
          margin-bottom = 10;
          # spacing = 4;
          modules-center = [
            "custom/launcher"
            "hyprland/workspaces"
            "custom/media"
            "idle_inhibitor"
            "custom/updater"
            "pulseaudio"
            "network"
            "cpu"
            "temperature"
            "backlight"
            "keyboard-state"
            "battery"
            "battery#bat2"
            "tray"
            "clock"
            "custom/power"
          ];

          "pulseaudio" = {
              format = "{icon} {volume:2}%";
              format-bluetooth = "{icon}  {volume}%";
              format-muted = "MUTE";
              format-icons = {
                  headphones = "";
                  default = [ "" "" ];
              };
              scroll-step = 5;
              on-click = "pamixer -t";
              on-click-right = "pavucontrol";
          };

          battery = {
              states = {
                  good = 95;
                  warning = 30;
                  critical = 15;
              };
              format = "{icon} {capacity}%";
              format-icons = [ "" "" "" "" "" ];
          };

          disk = {
              interval = 5;
              format = "Disk {percentage_used:2}%";
              path = "/";
          };

          backlight = {
            tooltip = false;
            format = " {}%";
            interval = 1;
            on-scroll-up = "brightnessctl s 1515";
            on-scroll-down = "brightnessctl s 1";
          };

          network = {
            format = "{ifname}";
            format-wifi = "{essid} ({signalStrength}%) ";
            format-ethernet = "Connected  ";
            format-disconnected = "Disconnected ⚠";
            tooltip-format = "{ifname} via {gwaddr} 󰊗";
            tooltip-format-wifi = "{essid} ({signalStrength}%) ";
            tooltip-format-ethernet = "{ifname} ";
            tooltip-format-disconnected = "Disconnected";
            max-length = 50;
          };

          keyboard-state = {
              numlock = true;
              capslock = true;
              format = " {name} {icon}";
              format-icons = {
                  locked = "";
                  unlocked = "";
              };
          };

          "hyprland/mode" = {
              format = "<span style=\"italic\">{}</span>";
          };

          idle_inhibitor = {
              format = "{icon}";
              format-icons = {
                  activated = "";
                  deactivated = "";
              };
          };

          tray = {
              icon-size = 20;
              spacing = 10;
          };

          clock = {
              tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
              format-alt = "{:%Y-%m-%d}";
            };

          cpu = {
              format = "{usage}% ";
              tooltip = false;
          };

          "custom/media" = {
              format = "{icon} {}";
              return-type = "json";
              max-length = 25;
              format-icons = {
                  spotify = " ";
                  default = " ";
              };
              escape = true;
              exec = "$HOME/.config/system_scripts/mediaplayer.py 2> /dev/null";
              on-click = "playerctl play-pause";
          };

          "custom/launcher" = {
              format = " ";
              on-click = "rofi -show drun";
              on-click-right = "killall rofi";
          };

          "custom/power" = {
              format = " ";
              on-click = "bash ~/.config/rofi/leave/powermenu.sh";
              on-click-right = "killall rofi";
          };
        };
      };
    };
  };
}
