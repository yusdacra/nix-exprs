{ pkgs }:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "kak-lsp";
  version = "7fcca8d";

  src = pkgs.fetchFromGitHub {
    owner = "ul";
    repo = pname;
    rev = "a69bc9599c57cef1ea7fad97e3483f80708e4ba4";
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
