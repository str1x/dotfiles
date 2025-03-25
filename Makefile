mount-all:
	stow --verbose --target=$$HOME --restow */
unmount-all:
	stow --verbose --target=$$HOME --delete */
