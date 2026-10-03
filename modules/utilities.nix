{ config, pkgs, ... }:

{
  services.printing.enable = true;

  environment.systemPackages = with pkgs; [
    bat
    tree
    tealdeer
    wl-clipboard
    ripgrep
    fzf
    htop
    btop
    unzip
  ];
}
