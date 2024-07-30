{ pkgs, ... }:

{
  home.packages = [pkgs.gh];

  programs.git = {
    enable = true;
    userName = "SamuelRuwe";
    userEmail = "ruwesam@gmail.com";
    aliases = {
      staash = "staash --all";
    };
    ignores = [ "*.swp" ];
    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "nvim";
      diff.algorithm = "histogram";
      log.date = "iso";
      column.ui = "auto";
      branch.sort = "committerdate";
      rerere.enabled = true;
    };
  };
}
