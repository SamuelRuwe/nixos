{ pkgs, lib, config, ... }:

{
  options = {
    cli.enable = lib.mkEnableOption "Enables cli config";
  };

  config = lib.mkIf config.cli.enable {
    home = {
      packages = with pkgs; [
        jq
      ];
    };
  };
}
