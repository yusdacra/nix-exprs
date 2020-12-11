{ pkgs, ... }:
let inherit (pkgs) callPackage;
in
{
  adwaita-slim-dark = callPackage ./adwaita-slim-dark.nix { inherit pkgs; };
}
