{
  pkgs ? import <nixpkgs> { },
}:
with pkgs;

let
    buildDeps = with pkgs; [
        (
          rust-bin.selectLatestNightlyWith (toolchain: toolchain.default.override {
            extensions = [ "cargo" "clippy" "rust-docs" "rust-std" "rustc" "rustfmt" "rust-src" ];
            targets = [ "x86_64-unknown-none" ];
          })
        )
    ];

    runtimeDeps = with pkgs; [
    ];

    libraryPath = pkgs.lib.makeLibraryPath runtimeDeps;
in
mkShell.override { } {
    nativeBuildInputs = with pkgs; [
    ] ++ buildDeps;

    buildInputs = with pkgs; [
    ] ++ runtimeDeps;
}
