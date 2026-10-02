{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gcc
    python3
  ];
}
