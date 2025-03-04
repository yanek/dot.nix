{
  outputs =
    inputs@{ ... }:
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

      pkgs = import inputs.nixpkgs-unstable {
        system = systemSettings.system;
        config = {
          allowUnfree = true;
          allowUnfreePredicate = (_: true);
        };
      };

      home-manager = inputs.home-manager-unstable;
    in
    {
      nixosConfigurations = {
        # nixos == hostname
        nixos = inputs.nixpkgs-unstable.lib.nixosSystem {
          system = systemSettings.system;
          specialArgs = {
            inherit pkgs-stable;
            inherit systemSettings;
            inherit userSettings;
            inherit inputs;
          };
          modules = [
            ./hosts/nixos.nix
          ];
        };
      };

      homeConfigurations = {
        nk = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit pkgs;
            inherit pkgs-stable;
            inherit systemSettings;
            inherit userSettings;
            inherit inputs;
          };
          modules = [
            ./users/nk.nix
            inputs.stylix.homeManagerModules.stylix
          ];
        };
      };
    };

  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs-unstable";

    stylix.url = "github:danth/stylix";

    home-manager-stable.url = "github:nix-community/home-manager/release-24.11";
    home-manager-stable.inputs.nixpkgs.follows = "nixpkgs-stable";

    home-manager-unstable.url = "github:nix-community/home-manager/master";
    home-manager-unstable.inputs.nixpkgs.follows = "nixpkgs-unstable";
  };
}
