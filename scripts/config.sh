setup_github_ssh() {
	# brew install pinentry-mac
	# echo "pinentry-program $(which pinentry-mac)" >> ~/.gnupg/gpg-agent.conf
	# killall gpg-agent

	if [ -z "${SSH_PASSPHRASE}" ]; then
		echo "SSH_PASSPHRASE not set"
	else
		info "Using $SSH_PASSPHRASE"
		ssh-keygen -t ed25519 -C "$SSH_PASSPHRASE"

		info "Adding ssh key to keychain"
		ssh-add -K ~/.ssh/id_ed25519

		info "Remember add ssh key to github account 'pbcopy < ~/.ssh/id_ed25519.pub'"
	fi
}

stow_dotfiles() {
	# shellcheck disable=SC2155
	# local to_stow="$(find stow -maxdepth 1 -type d -mindepth 1 | awk -F "/" '{print $NF}' ORS=' ')"
	# info "Stowing: $to_stow"
	# stow -d stow --verbose 1 --target "$HOME" "$to_stow"
	stow --dir $REPO_PATH --verbose 1 -R --restow .
}

nvim_step() {
	cargo install --git 'https://github.com/MordechaiHadad/bob.git'

	info "Installing latest nvim"
	bob install latest
	info "Set latest nvim version"
	bob use latest

	info "Installing nvim plugins"
	nvim --headless '+Lazy! sync' +qa

	success "Finished installing nvim"
}
