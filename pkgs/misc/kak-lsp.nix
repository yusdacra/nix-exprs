{ pkgs }:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "kak-lsp";
  version = "7fcca8d";

  src = pkgs.fetchFromGitHub {
    owner = "ul";
    repo = pname;
    rev = "4aaa97260847f40da4da4407f132fb3dce41e247";
    sha256 = "sha256-n9zqtkNckI4FNWN86mPyuNjjHMBDTSJ9Lv619DPLXkU=";
  };

  cargoSha256 = "sha256-kksF1/FN7ckztXPMdQq9XHmgvjJaIG/ZbMic/tOC1rQ=";

  meta = with pkgs.stdenv.lib; {
    description = "Kakoune Language Server Protocol Client";
    homepage = "https://github.com/ul/kak-lsp";
    license = with licenses; [ unlicense mit ];
    platforms = platforms.linux;
  };
}
