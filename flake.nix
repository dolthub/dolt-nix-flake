{
  description = "Relational database with version control and CLI a-la Git";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, flake-utils, nixpkgs }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
      lib = nixpkgs.lib;
    in
    {
      packages.default = pkgs.buildGoModule {
        name = "dolt";

        /* Based on https://github.com/NixOS/nixpkgs/blob/master/pkgs/servers/sql/dolt/default.nix */
        pname = "dolt";

        src = pkgs.fetchFromGitHub {
          owner = "dolthub";
          repo = "dolt";
          rev = "b6a077ceb9d7999d6af42e974b1b68b4a9cae38b";
          sha256 = "sha256-H00OgsVRGvBbeQiYQdzI850NFgUeYkVEziBkajLn4WI=";
        };

        modRoot = "./go";
        subPackages = [ "cmd/dolt" ];
        # Have to update every time the go dependencies change.
        vendorHash = "sha256-giDEKt6aE7P25iM7bgbezMyOXjZ8cv9GTFwdQfOLdSE=";
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
