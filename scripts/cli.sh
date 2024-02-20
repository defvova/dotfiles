install_rust_tools() {
	source "$HOME/.cargo/env"

	if ! command -v rust-analyzer &>/dev/null; then
		info "Installing rust-analyzer"
		brew install rust-analyzer
	fi

	if ! cargo audit --version &>/dev/null; then
		info "Installing cargo-audit"
		cargo install cargo-audit --features=fix
	fi

	if ! cargo edit --version &>/dev/null; then
		info "Installing cargo-edit"
		cargo install cargo-edit
	fi

	if ! cargo nextest --version &>/dev/null; then
		info "Installing cargo-nextest"
		cargo install cargo-nextest
	fi

	if ! cargo fmt --version &>/dev/null; then
		info "Installing rustfmt"
		rustup component add rustfmt
	fi

	if ! cargo clippy --version &>/dev/null; then
		info "Installing clippy"
		rustup component add clippy
	fi
}
