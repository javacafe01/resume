{
  description = "My resume project";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/master";

  outputs =
    { self
    , nixpkgs
    , flake-utils
    ,
    }:
    flake-utils.lib.eachDefaultSystem
      (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.nodejs-16_x
            pkgs.nodePackages.tailwindcss
          ];
        };
      });
}
