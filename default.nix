{ pkgs ? import <nixpkgs> { } }:
{
  modules = import ./modules;
  hmModules = import ./hm-modules;
} // import ./pkgs { inherit pkgs; }
