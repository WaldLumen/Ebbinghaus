{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOs/nixpkgs/release-23.05";
  };

  outputs = { self, nixpkgs, flake-utils}:
  let supported-systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" ]; in
  flake-utils.lib.eachSystem supported-systems
  (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
        devShell = pkgs.mkShell { buildInputs=[pkgs.jetbrains.pycharm-community pkgs.python3]; };
    }
  );
}