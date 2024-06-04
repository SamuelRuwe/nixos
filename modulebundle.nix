{ pkgs, lib, ... }: {
  imports = [ ./module1.nix ];

  module1.enable = true;
}
