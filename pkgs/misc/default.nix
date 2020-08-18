{ pkgs, ... }:
let inherit (pkgs) callPackage;
in {
  kak-lsp = callPackage ./kak-lsp.nix { inherit pkgs; };
  unite-shell = callPackage ./unite.nix { inherit pkgs; };
}
