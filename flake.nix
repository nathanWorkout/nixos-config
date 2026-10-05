{
  description = "Nathan's NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    heliumnix = {
      url = "git+https://codeberg.org/rozodru/heliumnix.git";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/hyprland";
  };

  outputs = { self, nixpkgs, heliumnix, hyprland, ... }@inputs: {
    nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/nixos-btw
        hyprland.nixosModules.default
      ];
    };
  };
}
