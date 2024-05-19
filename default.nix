{ lib, stdenv, fetchurl, makeWrapper, bash }:

let
  version = "1.9.4";
  tenv = stdenv.mkDerivation rec {
    pname = "tenv";
    inherit version;
    dontUnpack = true;

    src = fetchurl {
        url = "https://github.com/tofuutils/tenv/releases/download/v1.9.4/tenv_v1.9.4_Linux_x86_64.tar.gz";
        sha256 = "b12491f9ac61e5abfc64b716a9020aacc67ff873f3f01d6cc7175d945a7d2a4c";
    };

    nativeBuildInputs = [ makeWrapper ];
    buildInputs = [ bash ];

    installPhase = ''
      mkdir -p $out/bin
      tar xzvf $src -C $out/bin
    '';

    postFixup = ''
      wrapProgram $out/bin/tenv \
        --prefix PATH : ${lib.makeBinPath buildInputs} \
        --set TENV_ROOT /tmp
    '';

    meta = with lib; {
      description = "tenv - Terraform/OpenTofu/Terragrunt version manager";
      homepage = "https://github.com/tofuutils/tenv";
      license = licenses.mit;
      maintainers = with maintainers; [ maddinek ];
    };

    passthru.tests = {
      version-test = stdenv.mkDerivation {
        name = "tenv-version-test";
        buildInputs = [ tenv ];
        phases = [ "installPhase" "testPhase" ];
        installPhase = "touch $out";
        testPhase = ''
          echo "Running tenv --version command:"
          ${tenv}/bin/tenv --version
          echo "Checking version output:"
          ${tenv}/bin/tenv --version | grep "${version}"
        '';
      };
    };
  };
in
tenv
