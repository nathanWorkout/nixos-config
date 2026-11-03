{ config, pkgs, lib, ... }:

let
  sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "jake_the_dog";
  };
in
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
    shell        = pkgs.fish;
  };

  # Swap
  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 8192;
  }];

  # Virtualization
  virtualisation.vmware.host.enable = true;

  # SSH
  services.openssh.enable = true;

  # Flatpak
  services.flatpak.enable = true;

  # Zsh
  programs.fish.enable = true;

  programs.fzf.keybindings = true;
  programs.fzf.fuzzyCompletion = true;

  programs.starship.enable = true;

  programs.gamemode.enable = true;

  # SDDM
  environment.systemPackages = [ sddm-astronaut ];

  # samba
  services.tailscale.enable = true;

  services.displayManager.sddm = {
    enable = true;
    package = lib.mkForce pkgs.kdePackages.sddm;
    extraPackages = with pkgs; [ kdePackages.qtmultimedia ];
    theme = "sddm-astronaut-theme";
  };

  system.stateVersion = "26.05";
}
