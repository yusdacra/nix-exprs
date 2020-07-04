{ binName, buildType, sha256 ? pkgs.lib.fakeSha256, pkgs }:
let inherit (pkgs) stdenv unzip autoPatchelfHook fetchurl;
in stdenv.mkDerivation rec {
  pname = "${binName}-bin";
  version = "3.2.2";
  name = "${pname}-${version}";

  src = fetchurl {
    url =
      "https://downloads.tuxfamily.org/godotengine/${version}/Godot_v${version}-stable_${buildType}.64.zip";
    inherit sha256;
  };

  nativeBuildInputs = [ unzip autoPatchelfHook ];

  unpackPhase = "unzip $src";

  installPhase = "install -m755 -D *.64 $out/bin/${binName}";

  meta = with stdenv.lib; {
    platforms = [ "x86_64-linux" ];
    license = licenses.mit;
    description = "Multi-platform 2D and 3D game engine (${buildType} binary)";
  };
}
