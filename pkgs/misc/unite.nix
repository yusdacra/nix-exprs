{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "unite-shell";
  version = "d523b3d";

  src = pkgs.fetchFromGitHub {
    owner = "hardpixel";
    repo = "unite-shell";
    rev = "d523b3db2070a5312fc611e3c3c44fe1bd9cac3b";
    sha256 = "sha256-JZso8OOJIWTt4gsexvUlYJcl0zi7fc7GV/XcCtgrQ70=";
  };

  uuid = "unite@hardpixel.eu";

  buildInputs = [ pkgs.xorg.xprop ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/gnome-shell/extensions
    cp -r . $out/share/gnome-shell/extensions/${uuid}
    runHook postInstall
  '';

  meta = with pkgs.stdenv.lib; {
    description =
      "Unite is a GNOME Shell extension which makes a few layout tweaks to the top panel and removes window decorations to make it look like Ubuntu Unity Shell.";
    license = licenses.gpl3;
    homepage = "https://github.com/hardpixel/unite-shell";
  };
}
