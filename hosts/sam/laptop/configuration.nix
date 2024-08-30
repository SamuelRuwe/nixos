{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan
      ../shared.nix
      ./hardware-configuration.nix
    ];

  networking.hostName = "sams-laptop"; # Define your hostname.
}
