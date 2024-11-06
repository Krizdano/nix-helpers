{
  description = "Nix helpers - A simple script to simplify the usage of various nix commands.";

  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs = { self, nixpkgs, ... }:
    let
      supportedSystems = [
        "x86_64-linux"
        "i686-linux"
        "aarch64-linux"
      ];
      forAllSystems =
        f:
        nixpkgs.lib.genAttrs supportedSystems (
          system:
          f {
            pkgs = nixpkgs.legacyPackages.${system};
            inherit system;
          });
      in
      {
        packages = forAllSystems (
          { pkgs, system, ... }: {
            nix-helpers = pkgs.callPackage ./default.nix { };
            default = self.packages.${system}.nix-helpers;
          });
      };
}
