{ pkgs, config, ... }:

{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    # Pick "name" from https://github.com/kovidgoyal/kitty-themes/blob/master/themes.json
    theme = "Tokyo Night Storm";
  };
}
