{ pkgs, config, lib, ... }:

{
  options = {
    kitty.enable = lib.mkEnableOption "Enables kitty config";
  };

  config = lib.mkIf config.kitty.enable {
    programs.kitty = {
      enable = true;
      shellIntegration.enableZshIntegration = true;
      extraConfig = ''
        map ctrl+f send_text normal,application tmux-sessionizer\r
      '';
    };
  };
}
