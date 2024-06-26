{ pkgs ? import <nixpkgs> {} }:

let
  tenv = pkgs.callPackage ./default.nix {};
in

pkgs.mkShell {
  buildInputs = [ tenv ];

  shellHook = ''
    echo "Welcome to my development environment!"
    echo "Using tenv version: $(tenv --version)"
  '';
}
