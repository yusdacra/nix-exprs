{ pkgs }:
let
  inherit (pkgs) appimageTools fetchurl;
  inherit (pkgs.lib) fakeSha256;
  inherit (pkgs.stdenv) mkDerivation;
in
{
  appimagePackage =
    { binName
    , version
    , url
    , sha256 ? fakeSha256
    , meta ? { platforms = [ "x86_64-linux" ]; }
    }:
    let
      pname = "${binName}-appimage";
      name = "${pname}-${version}";

      src = fetchurl {
        inherit url sha256;
        name = "${name}.AppImage";
      };

      appimageContents = appimageTools.extractType2 { inherit name src; };
    in
    appimageTools.wrapType2 {
      inherit name src meta;

      extraInstallCommands = ''
        mv $out/bin/${name} $out/bin/${binName}
        install -m 444 -D ${appimageContents}/*.desktop $out/share/applications/${binName}.desktop
        sed -i 's/Exec=.*/Exec=${binName}/g' $out/share/applications/${binName}.desktop
      '';
    };

  buildFirefoxXpiAddon =
    { pname, version, addonId, url, sha256 ? fakeSha256, meta, ... }:
    mkDerivation {
      name = "firefox-addon-${pname}-${version}";

      inherit meta;

      src = fetchurl { inherit url sha256; };

      preferLocalBuild = true;
      allowSubstitutes = false;

      buildCommand = ''
        dst="$out/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}"
        mkdir -p "$dst"
        install -v -m644 "$src" "$dst/${addonId}.xpi"
      '';
    };
}
