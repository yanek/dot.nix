{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  mpv,
  openssl,
  makeWrapper,
  stdenv,
  darwin,
}:
rustPlatform.buildRustPackage {
  pname = "jellytui";
  version = "0.1.5";

  src = fetchFromGitHub {
    owner = "tyrantlink";
    repo = "jellytui";
    rev = "7b10490261672d750af2e3483b88f7daf017afb6";
    hash = "sha256-cMSZDSN2qnTeKL3ZcNVRtS45Xa1kEcps9WpWuWruX/0=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
  };

  nativeBuildInputs = [
    pkg-config
    makeWrapper
  ];

  buildInputs =
    [
      openssl
      mpv
    ]
    ++ lib.optionals stdenv.isDarwin [
      darwin.apple_sdk.frameworks.Security
      darwin.apple_sdk.frameworks.SystemConfiguration
      darwin.apple_sdk.frameworks.CoreFoundation
    ];

  postPatch = ''
    ln -s ${./Cargo.lock} Cargo.lock
  '';

  postInstall = ''
    wrapProgram $out/bin/jellytui \
      --prefix PATH : ${lib.makeBinPath [ mpv ]}
  '';

  meta = with lib; {
    description = "TUI client for Jellyfin, using mpv";
    homepage = "https://github.com/tyrantlink/jellytui";
    license = licenses.gpl3Only;
    maintainers = [ yanek ];
    mainProgram = "jellytui";
    platforms = platforms.all;
  };
}
