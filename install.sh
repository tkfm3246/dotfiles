# Homebrewのインストール
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# BrewfileからHomebrewでインストールするものをインストール
brew bundle --file=~/dotfiles/brew/Brewfile

# shellをzshに変更する
sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
chsh -s /usr/local/bin/zsh

# oh-my-zshのインストール
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Zshの設定ファイルをもってくる
cp -u zsh/.zshrc ~/

# Tmux Plugin Managerを入れる
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# tmux-powerlineを入れる
git clone https://github.com/erikw/tmux-powerline.git

# Powerline用のフォントを入れる
git clone https://github.com/powerline/fonts.git
cd fonts
sh install.sh
cd ../
rm -fR fonts

# Tmuxの設定ファイルをもってくる
cp -u tmux/.tmux.conf ~/
cp -u tmux/.tmux-powerlinerc ~/

# vimの設定ファイルをもってくる
mkdir -p ~/.config
mkdir -p ~/.config/nvim 
cp -u nvim/init.vim ~/.config/nvim
mkdir -p ~/.config/nvim/dein
mkdir -p ~/.config/nvim/dein/userconfig
cp -u nvim/dein/userconfig/dein.toml ~/dotfiles/nvim/dein/userconfig/
cp -u nvim/dein/userconfig/dein_lazy.toml ~/dotfiles/nvim/dein/userconfig
mkdir -p ~/.config/nvim/colors
cp -u nvim/colors/molokai.vim ~/.config/nvim/colors/

