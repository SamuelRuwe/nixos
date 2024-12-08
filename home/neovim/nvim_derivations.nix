{ pkgs, ... }:

let
  renamePkg = p: n: p.overrideAttrs (finalAttrs: previousAttrs: {
    postFixup = ''
      mv $out/bin/nvim $out/bin/${n}
    '';
  });


  nvimDev = pkgs.neovim.overrideAttrs (finalAttrs: previousAttrs: {
    postFixup = ''
      mv $out/bin/nvim $out/bin/nvimDev
    '';
  });

  updated_plugins = with pkgs.vimPlugins; [
    rose-pine
    nvim-treesitter.withAllGrammars
    {
      plugin = nvim-lspconfig;
      type = "lua";
      config = builtins.readFile ./lsp.lua;
    }
  ];

  pkg = {
    nvim2 = nvimDev.override { 
      configure = {
        packages.samsCustomStuff.start = updated_plugins; 
      };
    };
    # nvim3 = renamePkg pkgs.neovim "nvim3";
  };
in
pkg
