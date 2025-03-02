{
  outputs =
    inputs@{ self, ... }:
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
        theme = "gruvbox-dark";
      };

      pkgs-stable = import inputs.nixpkgs-stable {
        system = systemSettings.system;
        config = {
          allowUnfree = true;
          allowUnfreePredicate = (_: true);
        };
      };

      pkgs-unstable = import inputs.nixpkgs-unstable {
        system = systemSettings.system;
        config = {
          allowUnfree = true;
          allowUnfreePredicate = (_: true);
        };
      };

      forceStable = builtins.getEnv "FORCE_NIX_STABLE" == "true";

      pkgs = (if forceStable then pkgs-stable else pkgs-unstable);
      home-manager = (if forceStable then inputs.home-manager-stable else inputs.home-manager-unstable);
      nix-lib = (if forceStable then inputs.nixpkgs-stable.lib else inputs.nixpkgs-unstable.lib);
    in
    {
      nixosConfigurations = {
        # nixos == hostname
        nixos = nix-lib.nixosSystem {
          system = systemSettings.system;
          specialArgs = {
            inherit pkgs-stable;
            inherit systemSettings;
            inherit userSettings;
            inherit inputs;
          };
          modules = [
            ./profiles/test/configuration.nix
          ];
        };
      };

      homeConfigurations = {
        nk = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit pkgs-stable;
            inherit pkgs-unstable;
            inherit systemSettings;
            inherit userSettings;
            inherit inputs;
          };
          modules = [
            ./profiles/test/home.nix
          ];
        };
      };
    };

  inputs = {
    nixpkgs-stable = {
      url = "github:nixos/nixpkgs/nixos-24.11";
    };

    nixpkgs-unstable = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    home-manager-stable = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    home-manager-unstable = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };
}
