{ config, pkgs, ... }:

{
  services.printing.enable = true;

  environment.systemPackages = with pkgs; [
    bat
    tree
    tealdeer
    wl-clipboard
    ripgrep
    htop
    btop
    unzip
    zoom-us
  ];
}
