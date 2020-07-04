{ stdenv, appimagePackage }:
appimagePackage rec {
  binName = "mirage";
  version = "0.5.2";
  url =
    "https://github.com/mirukana/mirage/releases/download/v${version}/Mirage-v${version}-x86_64.AppImage";
  sha256 = "sha256-wZKE9A6+dqdQuLElTEhb2pSCMLus//8WVPCnE7dXU3c=";
  meta = with stdenv.lib; {
    platforms = [ "x86_64-linux" ];
    license = licenses.lgpl3;
    description = ''
      A fancy, customizable, keyboard-operable Qt/QML+Python Matrix chat client for encrypted and decentralized communication.
    '';
  };
}
