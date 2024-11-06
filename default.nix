{ pkgs, ... }:

pkgs.stdenv.mkDerivation {
  name = "nix-helpers";
  verson = "0.1";
  src = ./src/.;

  installPhase = ''
    # nix helpers
    mkdir -p $out/bin/
    cp -r ./include $out/bin/include
    cp ./nshell.sh $out/bin/nshell
    chmod +x $out/bin/nshell
    cp ./nrun.sh $out/bin/nrun
    chmod +x $out/bin/nrun
  '';
}
