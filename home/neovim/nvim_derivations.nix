{ pkgs, ... }:

let
  pkg = {
    nvim2 = pkgs.neovim.overrideAttrs (finalAttrs: previousAttrs: {
      plugins = previousAttrs.plugins;
      postFixup = ''
        mv $out/bin/nvim $out/bin/deeznutz
      '';
    });
  };
in
pkg
