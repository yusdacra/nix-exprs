{ pkgs }:
let
  binName = "godot-headless";
  buildType = "linux_headless";
  sha256 = "sha256-1+1VtpIIOsK+czp/grGCadHNRp3fOrHTMwMXav8baLE=";
in import ./common.nix { inherit binName buildType sha256 pkgs; }
