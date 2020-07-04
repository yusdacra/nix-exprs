{ lib, config, options, ... }:
let
  inherit (lib) mkIf mapAttrs' nameValuePair concatStrings splitString;
  cfg = config.networking.wireless.iwd;
in {
  config = mkIf cfg.enable {
    environment.etc."iwd/main.conf".text = ''
      [General]
      EnableNetworkConfiguration=true
      AddressRandomization=network

      [Network]
      NameResolvingService=resolvconf
    '';

    systemd.services = mapAttrs' (name: attrs:
      nameValuePair
      "add-wifi-network-${concatStrings (splitString " " name)}-to-iwd" {
        wantedBy = [ "network.target" ];
        before = [ "iwd.service" ];
        script = ''
          echo "
          [Security]
          Passphrase=${attrs.psk}
          " > "/var/lib/iwd/${name}.psk"
        '';
        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
          User = "root";
        };
      }) config.networking.wireless.networks;
  };
}
