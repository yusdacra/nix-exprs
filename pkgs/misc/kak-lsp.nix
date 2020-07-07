{ pkgs }:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "kak-lsp";
  version = "7fcca8d";

  src = pkgs.fetchFromGitHub {
    owner = "ul";
    repo = pname;
    rev = "7fcca8d7fdea7ea3f364f5098bbc8ec95655a981";
    sha256 = "sha256-aGSfNbIvdGrkOI3Ah89Yd4yMwlglEhBQYyC2+pv+7Kg=";
  };

  cargoSha256 = "sha256-6/dsMuf/Dj3/JVPNefAygMCQyxZL3noLuSz52Ja/OGw=";

  meta = with pkgs.stdenv.lib; {
    description = "Kakoune Language Server Protocol Client";
    homepage = "https://github.com/ul/kak-lsp";
    license = with licenses; [ unlicense mit ];
    platforms = platforms.linux;
  };
}
