{ lib, config, options, pkgs, ... }:
let cfg = config.programs.ion;
in
{
  options = {
    programs.ion =
      let inherit (lib) mkEnableOption mkOption types;
      in
      {
        enable = mkEnableOption "Ion Shell";
        extraConfig = mkOption {
          type = types.lines;
          default = "";
          description = ''
            Extra configuration to add to the end of initrc.
          '';
        };
        shellAliases = mkOption {
          type = types.attrs;
          default = { };
          description = ''
            Aliases that will be available in the shell.
          '';
        };
      };
  };

  config =
    let
      aliasesStr = lib.concatStringsSep "\n"
        (lib.mapAttrsToList (k: v: "alias ${k}=${lib.escapeShellArg v}")
          cfg.shellAliases);
      rc = lib.concatStringsSep "\n" [ aliasesStr cfg.extraConfig ];
    in
    lib.mkIf cfg.enable {
      home.packages = [ pkgs.ion ];
      xdg.enable = true;
      xdg.configFile."ion/initrc".text = rc;
    };
}
