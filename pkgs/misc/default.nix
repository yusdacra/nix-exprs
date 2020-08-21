{ pkgs, buildUtils, ... }:
let inherit (pkgs) callPackage;
in {
  kak-lsp = callPackage ./kak-lsp.nix { inherit pkgs; };
  unite-shell = callPackage ./unite-shell.nix { inherit pkgs; };
  librewolf = callPackage ./librewolf.nix {
    inherit (pkgs) stdenv;
    inherit (buildUtils) appimagePackage;
  };
}
