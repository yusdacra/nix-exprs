{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "adwaita-slim-dark";
  version = "c502a8b";

  src = pkgs.fetchFromGitHub {
    owner = "ch4rcoil";
    repo = "NewAdwaitaSlimDark";
    rev = "c502a8b95d691e063cc9871d3914ee59e7f7a005";
    sha256 = "sha256-UNtaI52Nb+biyKxl7L0ruCzdvDQ64wGVv+X2ZeF56Vw=";
  };

  installPhase = ''
    mkdir -p $out/share/themes/NewAdwaitaSlimDark
    cp -r . $out/share/themes/NewAdwaitaSlimDark
    rm $out/share/themes/NewAdwaitaSlimDark/{README.md,NewAdwaitaSlimDark.png}
  '';

  meta = with pkgs.stdenv.lib; {
    description = "Dark variant of NewAdwaita-slim";
    homepage = "https://github.com/ch4rcoil/NewAdwaitaSlimDark";
    platforms = platforms.linux;
  };
}
