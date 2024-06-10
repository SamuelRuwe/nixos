{ pkgs, ... }:

{
  home.packages = [pkgs.gh];

  programs.git = {
    enable = true;
    userName = "SamuelRuwe";
    userEmail = "ruwesam@gmail.com";
  };
}
