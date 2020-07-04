{ pkgs, buildUtils, ... }:
let
  inherit (buildUtils) appimagePackage;
  inherit (pkgs) callPackage stdenv;
in {
  mirage-appimage =
    callPackage ./mirage-appimage.nix { inherit stdenv appimagePackage; };
}
