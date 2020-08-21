{ stdenv, appimagePackage }:
appimagePackage rec {
  binName = "librewolf";
  version = "79.0-1";
  url =
    "https://gitlab.com/librewolf-community/browser/linux/uploads/df392f429834219fb66e8907278de339/LibreWolf-79.0-1.x86_64.AppImage";
  sha256 = "sha256-nSo5WDDsCi2IWWC+vTk8pIDLsRLikLT8oP+yyjBDsqM=";
  meta = with stdenv.lib; {
    platforms = [ "x86_64-linux" ];
    license = licenses.lgpl3;
    description = ''
      LibreWolf, the community-maintained fork of Librefox: a privacy and security-focused browser
    '';
  };
}
