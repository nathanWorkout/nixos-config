{ config, pkgs, ... }:

{
  services.printing.enable = true;

  environment.systemPackages = with pkgs; [
    # Termial tools
    bat
    tree
    tealdeer
    wl-clipboard
    ripgrep
    fzf
    htop
    btop
    eza
    zoxide
    fd
    dust

    # Some programs
    unzip
  ];
}
