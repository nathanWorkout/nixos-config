{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # editors
    vim
    neovim
    helix
    emacs
    zed-editor
    
    # tools
    git
    nodejs
    (qemu.override {
      cephSupport = false;
    })

    # compilers
    gcc
    cmake
    gnumake
    clang-tools 

    # langages
    python3
    zig_0_16
    zls_0_16

    # terms
    kitty
  ];
}
