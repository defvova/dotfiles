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

echo "$(tput setaf 2)=====> $(tput setaf 3)R2-D2: Installing system packages.$(tput sgr 0)"
packages=(
  "git"
  "node"
  "neovim"
  "python3"
  "zsh"
  "ripgrep"
  "fzf"
  "z"
  "htop"
  "archey"
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
npm install -g neovim

echo "$(tput setaf 2)=====> $(tput setaf 3)R2-D2: Installing oh-my-zsh.$(tput sgr 0)"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  echo "$(tput setaf 2)=====> $(tput setaf 3)R2-D2: oh-my-zsh already $(tput setaf 2)installed.$(tput sgr 0)"
fi

echo "$(tput setaf 2)=====> $(tput setaf 3)R2-D2: Installing spaceship prompt$(tput sgr 0)"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH/custom/themes/spaceship-prompt"
ln -s "$ZSH/custom/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH/custom/themes/spaceship.zsh-theme"

echo "$(tput setaf 2)=====> $(tput setaf 3)R2-D2: Installing vim linter (vint)$(tput sgr 0)"
pip3 install vim-vint

echo "$(tput setaf 2)=====> $(tput setaf 3)R2-D2: Installing bash language server$(tput sgr 0)"
npm i -g bash-language-server

echo "$(tput setaf 2)=====> $(tput setaf 3)R2-D2: Installing system fonts.$(tput sgr 0)"
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font

echo "$(tput setaf 2)=====> $(tput setaf 3)R2-D2: Installing zsh-autosuggestions.$(tput sgr 0)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

echo "$(tput setaf 2)=====> $(tput setaf 3)R2-D2: Installing vtop.$(tput sgr 0)"
npm install -g vtop

echo "$(tput setaf 2)=====> $(tput setaf 3)R2-D2: Installing Neovim plugins and linking dotfiles.$(tput sgr 0)"

source install/link.sh
nvim +PlugInstall +qall
nvim +UpdateRemotePlugins +qall

echo "$(tput setaf 2)=====> $(tput setaf 3)R2-D2: Installing Space vim-airline theme.$(tput sgr 0)"
cp ~/.config/nvim/space.vim ~/.local/share/nvim/plugged/vim-airline-themes/autoload/airline/themes/space.vim

echo "$(tput setaf 2)=====> $(tput setaf 3)R2-D2: Switching shell to zsh. You may need to logout.$(tput sgr 0)"
sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)

echo "$(tput setaf 2)=====> $(tput setaf 3)R2-D2: System update complete. Enjoy.$(tput sgr 0)"

exit 0
