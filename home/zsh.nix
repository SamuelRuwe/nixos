{ pkgs, ... }:

{
  programs.zsh = {
      enable = true;
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
}
