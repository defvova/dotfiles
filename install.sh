#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

. scripts/utils.sh
. scripts/packages.sh
. scripts/config.sh
. scripts/cli.sh
. scripts/fonts.sh
. scripts/osx.sh

cleanup() {
	err "Last command failed"
	info "Finishing..."
}

wait_input() {
	read -p -r "Press enter to continue: "
}

main() {
	info "Installing ..."

	info "################################################################################"
	info "Homebrew Packages"
	info "################################################################################"
	# wait_input
	install_packages

	success "Finished installing Homebrew packages"

	info "################################################################################"
	info "Homebrew Fonts"
	info "################################################################################"
	# wait_input
	install_fonts
	success "Finished installing fonts"


	info "################################################################################"
	info "Rust tools"
	info "################################################################################"
	# wait_input
	install_rust_tools
	success "Finished installing Rust tools"

	info "################################################################################"
	info "Configuration"
	info "################################################################################"
	# wait_input

	setup_osx
	success "Finished configuring MacOS defaults. NOTE: A restart is needed"

	stow_dotfiles
	success "Finished stowing dotfiles"

	info "################################################################################"
	info "SSH Key"
	info "################################################################################"
	setup_github_ssh
	success "Finished setting up SSH Key"

	if ! hash rustc &>/dev/null; then
		info "################################################################################"
		info "Rust Setup"
		info "################################################################################"
		# wait_input
		rustup-init
	fi

	info "################################################################################"
	info "Installing nvim version manager"
	info "################################################################################"
	nvim_step()

	info "Done"
	info "System needs to restart. Restart?"

	select yn in "y" "n"; do
		case $yn in
		y)
			sudo shutdown -r now
			break
			;;
		n) exit ;;
		esac
	done
}

trap cleanup SIGINT SIGTERM ERR EXIT

main
