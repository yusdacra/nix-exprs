{ pkgs, ... }:
let buildUtils = import ./build-utils.nix { inherit pkgs; };
in
import ./misc { inherit pkgs buildUtils; }
  // import ./themes { inherit pkgs; }
