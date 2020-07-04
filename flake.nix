{
  description = "Packages & modules @yusdacra maintains.";

  outputs = { self, nixpkgs }:
    let
      inherit (builtins) listToAttrs baseNameOf attrNames attrValues readDir;
      inherit (nixpkgs.lib) removeSuffix;
      system = "x86_64-linux";

      genAttrs' = values: f: listToAttrs (map f values);

      pathsToImportedAttrs = paths:
        genAttrs' paths (path: {
          name = removeSuffix ".nix" (baseNameOf path);
          value = import path;
        });

      pkgImport = pkgs:
        import pkgs {
          inherit system;
          config = { allowUnfree = true; };
        };

      pkgs = pkgImport nixpkgs;
    in {
      packages."${system}" = import ./pkgs { inherit pkgs; };

      overlay = import ./overlay.nix;

      nixosModules = let
        moduleList = import ./modules/list.nix;
        modulesAttrs = pathsToImportedAttrs moduleList;
      in modulesAttrs;
    };
}