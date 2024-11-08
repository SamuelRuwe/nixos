pkgs: attrs:
let
  defaultAttrs = {
    builder = "${pkgs.bash}/bin/bash";
    args = [ ./builder.sh ];
    setup = ./setup.sh;
    baseInputs = with pkgs; [
      gnutar
      gzip
      gnumake
      gcc
      coreutils
      findutils
      patchelf
      gawk
      gnused
      gnugrep
      binutils.bintools
    ];
    buildInputs = [ ];
    system = builtins.currentSystem;
  };
in
derivation (defaultAttrs // attrs)
