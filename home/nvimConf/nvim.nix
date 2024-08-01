{ config, pkgs, lib, ... }:
with lib;
let
  python-debug = pkgs.python3.withPackages (p: with p; [ debugpy ]);
in
{
  config = {
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      defaultEditor = true;

      plugins = with pkgs.vimPlugins; [
        nvim-web-devicons
        trouble-nvim
        vim-nix
        plenary-nvim

        {
          plugin = mini-nvim;
          type = "lua";
          config = builtins.readFile ./mini.lua;
        }

        {
          plugin = oil-nvim;
          type = "lua";
          config = builtins.readFile ./oil.lua;
        }

        {
          plugin = indent-blankline-nvim;
          type = "lua";
          config = builtins.readFile ./indent_line.lua;
        }

        {
          plugin = telescope-nvim;
          type = "lua";
          config = builtins.readFile ./telescope.lua;
        }


        nvim-treesitter.withAllGrammars

        fidget-nvim

        # Completions
        cmp-nvim-lsp
        cmp-buffer
        cmp-path
        cmp-cmdline
        cmp-nvim-lsp-signature-help
        nvim-cmp
        lspkind-nvim

        luasnip
        cmp_luasnip

        {
          plugin = nvim-lspconfig;
          type = "lua";
          config = builtins.readFile ./lspconfig.lua;
        }

        {
          plugin = which-key-nvim;
          type = "lua";
          config = builtins.readFile ./whichkey.lua;
        }

        {
          plugin = gitsigns-nvim;
          type = "lua";
          config = builtins.readFile ./gitsigns.lua;
        }

        {
          plugin = nvim-autopairs;
          type = "lua";
          config = builtins.readFile ./autopairs.lua;
        }
      ];

      extraPackages = with pkgs; [
        lua-language-server
      ];

      extraLuaConfig = ''
        ${builtins.readFile ./init.lua}
        ${builtins.readFile ./remap.lua}
        ${builtins.readFile ./set.lua}
      '';
    };
  };
}

