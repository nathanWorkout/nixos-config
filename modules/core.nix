{ config, pkgs, ... }:

{
  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Hostname
  networking.hostName = "nixos-btw";

  # Locale
  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS        = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT    = "fr_FR.UTF-8";
    LC_MONETARY       = "fr_FR.UTF-8";
    LC_NAME           = "fr_FR.UTF-8";
    LC_NUMERIC        = "fr_FR.UTF-8";
    LC_PAPER          = "fr_FR.UTF-8";
    LC_TELEPHONE      = "fr_FR.UTF-8";
    LC_TIME           = "fr_FR.UTF-8";
  };

  # Nix
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  # User
  users.users.nathan = {
    isNormalUser = true;
    description  = "nathan";
    extraGroups  = [ "networkmanager" "wheel" ];
    shell        = pkgs.zsh;
  };

  # swap
  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 8192; # 8GB
  }];

  # virtualization
  virtualisation.vmware.host.enable = true;

  # ssh
  services.openssh.enable = true;

  # flatpack
  services.flatpak.enable = true;

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;     
    syntaxHighlighting.enable = true;
  };

  programs.fzf.keybindings = true;
  programs.fzf.fuzzyCompletion = true;

  programs.starship.enable = true;

  system.stateVersion = "26.05";
}
