{ config, pkgs, inputs, ... }:

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
    fetch
    cmatrix
    feh

    # Some programs
    unzip
    zip
    acpi

    # browser
    inputs.heliumnix.packages.${pkgs.system}.default

    # editors
    onlyoffice-desktopeditors

    # Neovim
    tree-sitter
    lua-language-server
  ];
}
