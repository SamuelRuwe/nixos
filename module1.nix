{ pkgs, lib, config, ... }:
  let cfg = config.module1; in {
  options = {
    module1.enable = lib.mkEnableOption "enables module1";
  };

  config = lib.mkIf cfg.enable {
  };
}
