{ config, pkgs, ... }:

{
  networking.extraHosts = ''
    192.168.50.12 sams-laptop
    192.168.50.200 sams-home
  '';
}
