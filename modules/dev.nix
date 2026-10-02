{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    git
    gcc
    python3
  ];
}
