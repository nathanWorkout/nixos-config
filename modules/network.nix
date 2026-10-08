{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;   # clé SSH uniquement
  };

  programs.ssh.startAgent = true;

  environment.systemPackages = with pkgs; [
    wget
    curl
    nmap
    wireshark
    vmware-workstation
  ];
}
