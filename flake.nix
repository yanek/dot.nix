{
  outputs = inputs@{ ... }:
    let
      systemSettings = {
        system = "x86_64-linux";
        timezone = "Europe/Paris";
        locale = "en_US.UTF-8";
        bootMode = "uefi";
        bootMountPath = "/boot";
      };

      userSettings = {
        username = "nk";
        fullname = "Noé Ksiazek";
        email = "noe.ksiazek@pm.me";
        dotfilesDir = "home/${userSettings.username}/.dotfiles";
        theme = "nord";
      };

      pkgs-stable = import inputs.nixpkgs-stable {
        system = systemSettings.system;
        config = {
          allowUnfree = true;
          allowUnfreePredicate = (_: true);
        };
      };

      pkgs = import inputs.nixpkgs-unstable {
        system = systemSettings.system;
        config = {
          allowUnfree = true;
          allowUnfreePredicate = (_: true);
        };
      };

    in {
      nixosConfigurations = {
        nkdtop = inputs.nixpkgs-unstable.lib.nixosSystem {
          system = systemSettings.system;
          specialArgs = {
            inherit pkgs-stable;
            inherit systemSettings;
            inherit userSettings;
            inherit inputs;
          };
          modules = [ ./hosts/nkdtop.nix ];
        };
        nkltop = inputs.nixpkgs-unstable.lib.nixosSystem {
          system = systemSettings.system;
          specialArgs = {
            inherit pkgs-stable;
            inherit systemSettings;
            inherit userSettings;
            inherit inputs;
          };
          modules = [ ./hosts/nkltop.nix ];
        };
      };

    };

  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    stylix.url = "github:danth/stylix";
  };
}
