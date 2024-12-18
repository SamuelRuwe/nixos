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
        action_alias sessionize tmux-sessionizer
        map ctrl+f sessionize
      '';
    };
  };
}
