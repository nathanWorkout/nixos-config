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
    yazi
    fastfetch 

    # Some programs
    unzip

    # Neovim
    tree-sitter
    lua-language-server
  ];
}
