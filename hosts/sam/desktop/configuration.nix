{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../steam.nix
      ../shared.nix
      ./hardware-configuration.nix
    ];

  networking.hostName = "sams-home"; # Define your hostname.
  steam.enable = false;
}
