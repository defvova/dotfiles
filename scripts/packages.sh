taps=(
	homebrew/cask
	# homebrew/cask-fonts
	homebrew/core
)

packages=(
    bat       #  https://github.com/sharkdp/bat
	bottom    #  https://github.com/ClementTsang/bottom
	# cmake
	# ctags
	curl
	dust  #  https://github.com/bootandy/dust
    lsd
	fd    #  https://github.com/sharkdp/fd
	hyperfine  #  https://github.com/sharkdp/hyperfine
    lazygit
	lazydocker #  https://github.com/jesseduffield/lazydocker
    tig
	git-delta #  https://github.com/dandavison/delta
	gnu-sed
    duf
    starship
    # podman
    # podman-compose
    # font-hack-nerd-font
    # font-jetbrains-mono-nerd-font
	universal-ctags
    fnm
    frum
	neovim
	procs #  https://github.com/dalance/procs/
	ripgrep #  https://github.com/BurntSushi/ripgre
	rustup
	stow
	zoxide #  https://github.com/ajeetdsouza/zoxide
	zellij
    speedtest-cli
    youtube-dl
    mplayer
)

install_packages() {
	info "Configuring taps"
	apply_brew_taps "${taps[@]}"

	info "Installing packages..."
	install_brew_formulas "${packages[@]}"

	info "Cleaning up brew packages..."
	brew cleanup
}
