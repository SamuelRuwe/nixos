{ config, pkgs, lib, ... }:
{

  options = {
    waybar.enable = lib.mkEnableOption "Enables waybar config";
  };

  config = lib.mkIf config.waybar.enable {
    programs.waybar = {
      enable = true;
      systemd.enable = true;
      # style = ./waybar.css;
      settings = {
        mainBar = {
          modules-left = ["sway/workspaces" "sway/mode" "cpu" "memory"];
          modules-center = [];
          modules-right = ["network" "clock"];

          cpu = {
            interval = 15;
            format = "  {}%";
            max-length = 10;
          };

          memory = {
            interval = 30;
            format = "  {}%";
            max-length = 10;
          };

          "pulseaudio" = {
            format = "{volume}% {icon}";
            format-bluetooth = "{volume}% {icon}";
            format-muted = "";
            format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = ["" ""];
            };
            scroll-step = 1;
            on-click = "pavucontrol";
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
            format-ethernet = "{ipaddr}/{cidr} 󰊗";
            format-disconnected = "󰤮";
            tooltip-format = "{ifname} via {gwaddr} 󰊗";
            tooltip-format-wifi = "{essid} ({signalStrength}%) ";
            tooltip-format-ethernet = "{ifname} ";
            tooltip-format-disconnected = "Disconnected";
            max-length = 50;
          };

          battery = {
            format = "{capacity}% {icon}";
            "format-icons" =  ["" "" "" "" ""];
          };

          clock = {
            "format-alt" = "{:%a, %d. %b  %H:%M}";
          };
        };
      };
    };
  };
}
