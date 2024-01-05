/* WARNING: This file is generated by main.go in github.com/dolthub/dolt-nix-flake. */
{
  description = "Relational database with version control and CLI a-la Git";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    dolt.url = "github:dolthub/dolt";
    dolt.flake = false;
  };

  outputs = { self, dolt, flake-utils, nixpkgs }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
      lib = nixpkgs.lib;
    in
    {
      devShells.default = pkgs.mkShell {
        buildInputs = [
          self.packages.${system}.dolt-nix-flake
          pkgs.nix
          pkgs.unzip
          pkgs.go
          pkgs.git
        ];
      };

      packages.dolt-nix-flake = pkgs.buildGoModule {
        name = "dolt-nix-flake";
        pname = "dolt-nix-flake";

        src = ./.;
        modRoot = ".";
        vendorHash = null;
      };

      packages.default = pkgs.buildGoModule {
        name = "dolt";

        /* Based on https://github.com/NixOS/nixpkgs/blob/master/pkgs/servers/sql/dolt/default.nix */
        pname = "dolt";

        src = dolt;
        modRoot = "./go";
        subPackages = [ "cmd/dolt" ];
        vendorHash = "sha256-G/PoxcLLLe29+sv0TW1Ja6EtYE6ddsPCw44tzA5Rf3E=";
        proxyVendor = true;
        doCheck = false;

        meta = with lib; {
          description = "Relational database with version control and CLI a-la Git";
          homepage = "https://github.com/dolthub/dolt";
          license = licenses.asl20;
          maintainers = with maintainers; [ danbst ];
        };
      };
    });
}
