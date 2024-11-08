let
  pkgs = import <nixpkgs> { config = {}; overlays = []; };
in
{
  hello = pkgs.callPackage ./hello.nix { };
  dn = pkgs.callPackage ./hello.nix { };
}
