{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    neovim
    helix
    git
    gcc
    python3
  ];
}
