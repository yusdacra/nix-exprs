{ pkgs }:
let
  binName = "godot-server";
  buildType = "linux_server";
  sha256 = "sha256-HXQfe9P0P0j9uXvA73coaPsWtqFsxlL3c/kDc+JLyVA=";
in import ./common.nix { inherit binName buildType sha256 pkgs; }
