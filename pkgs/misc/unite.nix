{ pkgs }:

pkgs.stdenv.mkDerivation rec {
  pname = "unite-shell";
  version = "41";

  src = pkgs.fetchzip {
    url =
      "https://github.com/hardpixel/unite-shell/releases/download/v${version}/unite-shell-v${version}.zip";
    sha256 = "sha256-JZso8OOJIWTt4gsexvUlYJcl0zi7fc7GV/XcCtgrQ70=";
  };

  uuid = "unite@hardpixel.eu";

  buildInputs = [ pkgs.xorg.xprop ];

  installPhase = ''
    mkdir -p $out/share/gnome-shell/extensions/${uuid}
    cp -r . $out/share/gnome-shell/extensions/${uuid}
  '';

  meta = with pkgs.stdenv.lib; {
    description =
      "Unite is a GNOME Shell extension which makes a few layout tweaks to the top panel and removes window decorations to make it look like Ubuntu Unity Shell.";
    license = licenses.gpl3;
    homepage = "https://github.com/hardpixel/unite-shell";
  };
}
