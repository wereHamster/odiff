{
  description = "The fastest image difference tool in the world";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    opam-nix.url = "github:tweag/opam-nix";
  };

  outputs = { self, opam-nix, flake-utils }:
      flake-utils.lib.eachDefaultSystem (system:
        with opam-nix.lib.${system}; {
          defaultPackage = (buildDuneProject { } "odiff" ./. { }).odiff;
        });
}
