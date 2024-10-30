{
  description = "A basic flakelight templ to be used with nix-direnv";

  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    flakelight.url = "github:nix-community/flakelight";
  };

  outputs = { flakelight, nixpkgs, ... }:
    flakelight ./. {

      inputs.nixpkgs = nixpkgs;

      devShell.packages = pkgs:
        let
          mainPackages = with pkgs; [

            bun
            nodejs

            coreutils

            lefthook

            awscli2

          ];
          nodePackages = with pkgs.nodePackages; [ vercel ];
        in mainPackages ++ nodePackages;
    };

}
