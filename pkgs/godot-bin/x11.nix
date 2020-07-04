{ pkgs, alsaLib, libX11, libXcursor, libXinerama, libXrandr, libXrender, libXi
, libpulseaudio, libGLU }:
let
  binName = "godot";
  buildType = "x11";
  sha256 = "sha256-FnZhkhQpii0c9LzM18CuHE9A7cFNDmVOL24MtWM9zDw=";
in (import ./common.nix {
  inherit binName buildType sha256 pkgs;
}).overrideAttrs (prev: {
  buildInputs = [
    alsaLib
    libX11
    libXcursor
    libXinerama
    libXrandr
    libXrender
    libXi
    libpulseaudio
    libGLU
  ];
})
