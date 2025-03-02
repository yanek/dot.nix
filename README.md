# NixOS Config

## Install

`TODO: Figure out some kind of easily reproducible install procedure.`

## Modules

I have my modules separated in two groups:

- System-level - stored in the `system` directory
  - all submodules are imported in the root module `configuration.nix`
- User-level - stored in the `user` directory
  - all submodules are imported in the root module `home.nix`

Entry points are located in `profiles`, each profile could represent a different workspace or even a totally different machine.
