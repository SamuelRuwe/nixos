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
          spacing = 4;

          modules-left = ["hyprland/workspaces" "custom/right-arrow-dark"];
          modules-center = [
            "custom/left-arrow-dark"
            "clock#1"
            "custom/left-arrow-light"
            "custom/left-arrow-dark"
            "clock#2"
            "custom/right-arrow-dark"
            "custom/right-arrow-light"
            "clock#3"
            "custom/right-arrow-dark"
          ];
          modules-right = [
            "custom/left-arrow-dark"
            "pulseaudio"
            "custom/left-arrow-light"
            "custom/left-arrow-dark"
            "memory"
            "custom/left-arrow-light"
            "custom/left-arrow-dark"
            "cpu"
            "custom/left-arrow-light"
            "custom/left-arrow-dark"
            "battery"
            "custom/left-arrow-light"
            "custom/left-arrow-dark"
            "disk"
            "custom/left-arrow-light"
            "custom/left-arrow-dark"
            "tray"
          ];

          memory = {
            interval = 30;
            format =  "Mem {}%";
            max-length = 10;
          };

          "custom/left-arrow-dark" = {
              format = "";
              tooltip = false;
          };

          "custom/left-arrow-light" = {
              format = "";
              tooltip = false;
          };

          "custom/right-arrow-dark" = {
              format = "";
              tooltip = false;
          };
          "custom/right-arrow-light" = {
              format = "";
              tooltip = false;
          };

          "hyprland/workspaces" = {
              disable-scroll = true;
              format = "{name}";
          };

          "clock#1" = {
              format = "{:%a}";
              tooltip = false;
          };

          "clock#2" = {
              format = "{:%H:%M}";
              tooltip = false;
          };

          "clock#3" = {
              format = "{:%m-%d}";
              tooltip = false;
          };

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
        };
      };
    };
  };
}
