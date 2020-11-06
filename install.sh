# !/bin/sh

echo "---------------------------------------------------------"
echo "$(tput setaf 3)Greetings! My name is R2-D2 and I will help you to setup dev mode.$(tput sgr 0)"
echo "$(tput sgr 0)"
echo "$(tput setaf 3)R2-D2: Preparing to power up and begin diagnostics.$(tput sgr 0)"
echo "---------------------------------------------------------"

echo "$(tput setaf 2)=====> $(tput setaf 3)R2-D2: Checking for Homebrew installation.$(tput sgr 0)"
brew="/usr/local/bin/brew"
if [ -f "$brew" ]
then
  echo "$(tput setaf 2)=====> $(tput setaf 3)R2-D2: Homebrew is $(tput setaf 2)installed.$(tput sgr 0)"
else
  echo "$(tput setaf 9)=====> R2-D2: Installing Homebrew. Homebrew requires osx command lines tools, please download xcode first$(tput sgr 0)"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "$(tput setaf 2)=====> $(tput setaf 3)R2-D2: Installing oh-my-zsh.$(tput sgr 0)"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "$(tput setaf 2)=====> $(tput setaf 3)R2-D2: oh-my-zsh already $(tput setaf 2)installed.$(tput sgr 0)"
fi

echo "$(tput setaf 2)=====> $(tput setaf 3)R2-D2: Installing system packages.$(tput sgr 0)"
packages=(
  "git"
  "neovim"
  "ripgrep"
  "fzf"
  "yarn"
  "nnn"
  "gnu-sed"
  "trash-cli"
  "unzip"
  "gnu-tar"
  "bat"
  "clementtsang/bottom/bottom"
  "lsd"
  "procs"
  "starship"
  "zoxide"
  "muesli/tap/duf"
  "zsh-autosuggestions"
  "romkatv/powerlevel10k/powerlevel10k"
)
for i in "${packages[@]}"
do
  echo "$(tput setaf 2)=====> $(tput setaf 3)R2-D2: $i is $(tput setaf 2)installed.$(tput sgr 0)"
done

localGit="/usr/local/bin/git"
if ! [[ -f "$localGit" ]]; then
  echo "$(tput setaf 9)=====> R2-D2: Invalid git installation. Aborting. Please install git.$(tput sgr 0)"
  exit 1
fi

echo "$(tput setaf 2)=====> $(tput setaf 3)R2-D2: Installing Python NeoVim client.$(tput sgr 0)"
pip3 install neovim

echo "$(tput setaf 2)=====> $(tput setaf 3)R2-D2: Installing node neovim package$(tput sgr 0)"
yarn global add neovim

echo "$(tput setaf 2)=====> $(tput setaf 3)R2-D2: Installing powerlevel10k.$(tput sgr 0)"
echo 'source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc

echo "$(tput setaf 2)=====> $(tput setaf 3)R2-D2: Installing system fonts.$(tput sgr 0)"
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font

echo "$(tput setaf 2)=====> $(tput setaf 3)R2-D2: Installing universal ctags.$(tput sgr 0)"
brew install --HEAD universal-ctags/universal-ctags/universal-ctags

echo "$(tput setaf 2)=====> $(tput setaf 3)R2-D2: Installing syntax highlighting.$(tput sgr 0)"
git clone https://github.com/zdharma/fast-syntax-highlighting.git ~ZSH_CUSTOM/plugins/fast-syntax-highlighting

echo "$(tput setaf 2)=====> $(tput setaf 3)R2-D2: Installing Neovim plugins and linking dotfiles.$(tput sgr 0)"
source install/link.sh
nvim +PlugInstall +qall
nvim +UpdateRemotePlugins +qall

echo "$(tput setaf 2)=====> $(tput setaf 3)R2-D2: System update complete. Enjoy.$(tput sgr 0)"

exit 0
