{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan
      ../steam.nix
      ../shared.nix
      ./hardware-configuration.nix
    ];

  networking.hostName = "sams-laptop"; # Define your hostname.

  steam.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  services.blueman.enable = true;
  services.libinput.touchpad.naturalScrolling = true;
}
