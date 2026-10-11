{
  flake.modules.homeManager.secretspec = {pkgs, ...}: let
    version = "0.21.1";

    secretspec = pkgs.stdenv.mkDerivation {
      pname = "secretspec";
      version = "0.21.1";

      src = pkgs.fetchzip {
        url = "https://github.com/cachix/secretspec/releases/download/v${version}/secretspec-x86_64-unknown-linux-gnu.tar.xz";
        hash = "sha256-eUlEE8A8ml0A36lVfhe9ta4MfzhUnaVoObEknwTlZKY=";
      };

      dontBuild = true;

      installPhase = ''
        runHook preInstall
        install -Dm755 secretspec $out/bin/secretspec
        runHook postInstall
      '';
    };
  in {
    home.packages = [secretspec];
  };
}
