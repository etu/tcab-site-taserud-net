{
  description = "Taserud Consulting AB Site: Taserud.net";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable-small;
    flake-utils.url = "flake-utils";
    taserud-theme-albatross.url = git+ssh://gitea@git.elis.nu/WebLizard/theme-albatross;
    taserud-theme-albatross.inputs.flake-utils.follows = "flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  } @ inputs: (flake-utils.lib.eachSystem ["x86_64-linux"] (system: let
    pkgs = nixpkgs.legacyPackages.${system};
    tpkgs = inputs.taserud-theme-albatross.packages.${system};
  in {
    packages.hugo = tpkgs.hugo;
    packages.theme = tpkgs.theme;
    packages.default = pkgs.stdenv.mkDerivation {
      name = "site-taserud-net";
      src = ./src;

      nativeBuildInputs = [
        # install theme pinned hugo
        tpkgs.hugo

        # needed to process the svg and have the correct fonts
        pkgs.inkscape
        pkgs.freefont_ttf
      ];

      buildPhase = ''
        # Install theme
        mkdir -p themes
        ln -s ${tpkgs.theme} themes/${tpkgs.theme.theme-name}

        # Export icon from SVG logo
        inkscape --export-type=png \
                 --export-filename=static/img/icon.png \
                 static/img/logo-dark.svg

        # Export SVG to SVG to not rely on system fonts
        inkscape --export-type=svg \
                 --export-filename=static/img/logo-dark.svg \
                 --vacuum-defs \
                 --export-plain-svg \
                 --export-text-to-path static/img/logo-dark.svg
        inkscape --export-type=svg \
                 --export-filename=static/img/logo-light.svg \
                 --vacuum-defs \
                 --export-plain-svg \
                 --export-text-to-path static/img/logo-light.svg

        # Build page
        hugo --logLevel debug
      '';

      installPhase = ''
        cp -vr public/ $out
      '';
    };

    # Specify formatter package for "nix fmt ." and "nix fmt . -- --check"
    formatter = pkgs.alejandra;
  }));
}
