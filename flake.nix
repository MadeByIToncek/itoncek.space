{
  description = "IToncek.space site";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    papermod-theme = {
      url = "github:adityatelange/hugo-PaperMod";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, papermod-theme }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      pkgsFor = forAllSystems (system: import nixpkgs { inherit system; });
    in
    {
      packages = forAllSystems (system: {
        default = pkgsFor.${system}.stdenv.mkDerivation {
          pname = "itoncek-space";
          version = "1.0.0";
          src = ./.;

          nativeBuildInputs = [ pkgsFor.${system}.hugo ];

          buildPhase = ''
            export HUGO_CACHE_DIR=$(mktemp -d)
            mkdir -p themes/PaperMod
            cp -r ${papermod-theme}/* themes/PaperMod/
            hugo --minify --gc
          '';

          installPhase = ''
            mkdir -p $out
            cp -r public/* $out/
          '';
        };
      });

      devShells = forAllSystems (system: {
        default = pkgsFor.${system}.mkShell {
          packages = [ 
            pkgsFor.${system}.hugo 
            pkgsFor.${system}.go
          ];
        };
      });

      nixosModules.default = { config, lib, pkgs, ... }: {
        options.services.itoncek-space = {
          enable = lib.mkEnableOption "Serve";
          domain = lib.mkOption {
            type = lib.types.str;
            example = "itoncek.space";
            description = "Domain name";
          };
        };

        config = lib.mkIf config.services.itoncek-space.enable {
          services.caddy.enable = true;

          services.caddy.virtualHosts.${config.services.itoncek-space.domain} = {
            extraConfig = ''
              respond /.well-known/matrix/client "{\"m.homeserver\":{\"base_url\":\"https://matrix.itoncek.space/\"}}" 200
              respond /.well-known/matrix/server "{\"m.server\":\"matrix.itoncek.space:443\"}" 200
              root * ${self.packages.${pkgs.stdenv.hostPlatform.system}.default}
              file_server
            '';
          };
        };
      };
    };
}
