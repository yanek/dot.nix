{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

    hm.url = "github:nix-community/home-manager/master";
    hm.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-stable,
      hm,
      ...
    }@inputs:
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
        homeDir = "/home/${userSettings.username}";
        dotfilesDir = "${userSettings.homeDir}/.dotfiles";
        theme = "nord";
      };

      pkgs-stable = import nixpkgs-stable {
        system = systemSettings.system;
        config = {
          allowUnfree = true;
        };
      };

      pkgs = import nixpkgs {
        system = systemSettings.system;
        config = {
          allowUnfree = true;
        };
      };

    in
    {
      nixosConfigurations = {
        nkdtop = nixpkgs.lib.nixosSystem {
          inherit pkgs;
          system = systemSettings.system;
          specialArgs = {
            inherit inputs;
            inherit pkgs-stable;
            inherit systemSettings;
            inherit userSettings;
          };
          modules = [
            /etc/nixos/hardware-configuration.nix
            ./host/nkdtop.nix
          ];
        };
        nkltop = nixpkgs.lib.nixosSystem {
          system = systemSettings.system;
          specialArgs = {
            inherit pkgs-stable;
            inherit systemSettings;
            inherit userSettings;
          };
          modules = [
            /etc/nixos/hardware-configuration.nix
            ./host/nkltop.nix
          ];
        };
      };

      homeConfigurations = {
        "nk@nkdtop" = hm.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit pkgs;
            inherit systemSettings;
            inherit userSettings;
          };
          modules = [
            ./home/nk.nix
            inputs.stylix.homeManagerModules.stylix
          ];
        };
      };

      devShells.${systemSettings.system}.default = pkgs.mkShell {
        packages = [
          pkgs.go-task
          pkgs.nil
          pkgs.nixfmt-rfc-style
        ];
      };

    };

}
