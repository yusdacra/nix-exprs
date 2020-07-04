{ pkgs, ... }:
let inherit (pkgs) callPackage;
in {
  godot-bin = callPackage ./x11.nix { };
  godot-headless-bin = callPackage ./headless.nix { };
  godot-server-bin = callPackage ./server.nix { };
}
