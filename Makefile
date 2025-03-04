os:
	doas nh os switch . -R

home:
	nh home switch .

commit:
	dotfiles-commit
	git push
