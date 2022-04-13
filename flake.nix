{
  description = "Implement a custom state transition function for the Deku sidechain with Go";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { self
    , nixpkgs
    , flake-utils
    }:
      with flake-utils.lib;
      eachSystem defaultSystems (system:
      let pkgs = import nixpkgs { inherit system; }; in
      {
        devShell = pkgs.mkShell {
          nativeBuildInputs = with pkgs;
            [
              # Go developer tooling
              go
              gopls
              gore
            ];
        };
      });
}
