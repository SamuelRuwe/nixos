{ pkgs ? import <nixpkgs> {} }:
pkgs.stdenv.mkDerivation {
  name = "hello-world";
  src = ./src;
  buildPhase = ''
    g++ hello-world.cpp -o hello-world
  '';
  installPhast = ''
    mkdir -p $out/bin
    cp hello-world $out/bin
  '';
}
