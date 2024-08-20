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
          margin-bottom = 5;
          spacing = 4;

        modules-left = [ "custom/launcher" "custom/media" "tray"];
        modules-center = [ "idle_inhibitor" "custom/updater" "custom/snip" "custom/wallpaper" "pulseaudio" "cpu" "memory" "temperature" "backlight" "keyboard-state"  "battery" "battery#bat2" "network" "clock"];
        modules-right = [ "river/tags" "custom/power" ];

          "river/tags" = {
              num-tags = 5;
          };

          "keyboard-state" = {
              numlock = true;
              capslock = true;
              format = " {name} {icon}";
              format-icons = {
                  locked = "";
                  unlocked = "";
              };
          };

          "idle_inhibitor" = {
              "format" = "{icon}";
              "format-icons" = {
                  "activated" = "";
                  "deactivated" = "";
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
          memory = {
              format = "{}% ";
          };

          temperature = {
              critical-threshold = 80;
              format = "{temperatureC}°C {icon}";
              format-icons = ["" "" ""];
          };

          backlight = {
              format = "{percent}% {icon}";
              format-icons = ["" ""];
          };

          battery = {
              states = {
                  good = 95;
                  warning = 30;
                  critical = 15;
              };
              format = "{capacity}% {icon}";
              format-charging = "{capacity}% ";
              format-plugged = "{capacity}% ";
              format-alt = "{time} {icon}";
              format-icons = ["" "" "" "" ""];
          };

          "battery#bat2" = {
              bat = "BAT2";
          };

          network = {
              format-wifi = "{essid} ({signalStrength}%) ";
              format-ethernet = "Connected  ";
              tooltip-format = "{ifname} via {gwaddr} ";
              format-linked = "{ifname} (No IP) ";
              format-disconnected = "Disconnected ⚠";
              format-alt = "{ifname} = {ipaddr}/{cidr}";
              on-click-right = "bash ~/.config/rofi/wifi_menu/rofi_wifi_menu";
          };

          pulseaudio = {
              format = "{volume}% {icon}";
              format-bluetooth = "{volume}% {icon}";
              format-bluetooth-muted = "{icon} {format_source}";
              format-muted = "{format_source}";
              format-source = "";
              format-source-muted = "";
              format-icons = {
                  headphone = "";
                  hands-free = "";
                  headset = "";
                  phone = "";
                  portable = "";
                  car = "";
                  default = ["" "" ""];
              };
              on-click = "pavucontrol";
          };

          "custom/media" = {
              format = "{icon} {}";
              return-type = "json";
              max-length = 20;
              format-icons = {
                  spotify = " ";
                  default = " ";
              };
              escape = true;
              exec = "$HOME/.config/system_scripts/mediaplayer.py 2> /dev/null";
              on-click = "playerctl play-pause";
          };

          "custom/launcher" = {
              format = "";
              on-click = "rofi --show drun";
              on-click-right = "killall rofi";
          };

          "custom/power" ={
              format = "  ";
              on-click = "wlogout";
          };

          "custom/snip" ={
              format = " ";
              on-click = "grimshot --notify save area $HOME/Pictures/$(zenity --entry --text 'Set filename:' --entry-text '.png')";
          };
        };
      };
    };
  };
}
