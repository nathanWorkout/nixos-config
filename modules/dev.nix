{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # editors
    vim
    neovim
    helix
    
    # tools
    git
    (qemu.override {
      cephSupport = false;
      glusterfsSupport = false;
    })

    # compilers
    gcc

    # langages
    python3
    zig_0_16
    zls_0_16
  ];
}
