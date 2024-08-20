{ pkgs, lib, config, ... }:

{
  options = {
    discord.enable = lib.mkEnableOption "Enables discord config";
  };

  config = lib.mkIf config.cli.enable {
    nixpkgs.config = {
      allowUnfree = true;
    };

    packages = with pkgs; [
      discord
    ];
  };
}
