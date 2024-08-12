{ pkgs, config, lib, ... }:

{

  options = {
    kitty.enable = lib.mkEnableOption "Enables kitty config";
  };

  config = lib.mkIf config.kitty.enable {
    programs.kitty = {
      enable = true;
      shellIntegration.enableZshIntegration = true;
      # Pick "name" from https://github.com/kovidgoyal/kitty-themes/blob/master/themes.json
      theme = "Tokyo Night Storm";
    };
  };
}
