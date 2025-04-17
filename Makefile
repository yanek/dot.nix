all:
	os
	home

os:
	nixos-rebuild switch --flake . --impure
	bash scripts/commit.sh

home:
	home-manager switch --flake .
	bash scripts/commit.sh
