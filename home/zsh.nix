{ pkgs, lib, config, ... }:

{
  options = {
    zsh.enable = lib.mkEnableOption "Enables zsh config";
  };

  config = lib.mkIf config.zsh.enable {
    programs = {
      zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        dotDir = ".config/zsh";

        oh-my-zsh = {
            enable = true;
            theme = "agnoster";
        };

        shellAliases = {
            ll = "ls -l";
            update = "sudo nixos-rebuild switch --flake '.#default'";
            cl = "clear";
        };
      };

      thefuck = {
        enable = true;
        enableZshIntegration = true;
      };
    };
  };
}
