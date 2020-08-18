{ pkgs, ... }:
let buildUtils = import ./build-utils.nix { inherit pkgs; };
in import ./godot-bin { inherit pkgs; }
// import ./im { inherit pkgs buildUtils; } // import ./misc { inherit pkgs; }
// import ./themes { inherit pkgs; }
