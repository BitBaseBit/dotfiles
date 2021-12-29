sudo apt-get -y install ca-certificates curl gnupg lsb-release
sudo apt-get -y install zsh
sudo apt-get -y install dbus-x11 default-jre diffutils
sudo apt-get -y install openssl
sudo apt-get -y install -y libcurl4-openssl-dev
sudo apt-get -y install  build-essential

deb http://apt.llvm.org/hirsute/ llvm-toolchain-hirsute-13 main
deb-src http://apt.llvm.org/hirsute/ llvm-toolchain-hirsute-13 main
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -
# Fingerprint: 6084 F3CF 814B 57C1 CF12 EFD5 15CF 4D18 AF4F 7421
sudo apt-get update
sudo apt-get install -y clang-13 clang-tools-13 clang-13-doc libclang-common-13-dev libclang-13-dev libclang1-13 clang-format-13 python-clang-13 clangd-13
sudo apt-get install -y lldb-13 lld-13 libc++-13-dev libc++abi-13-dev libomp-13-dev clang-tidy-13
sudo apt-get install -y g++-11
sudo apt-get install -y gcc-11
sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-13 100 
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-13 100 
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-11 100 
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-13 100 
# install nodejs
# curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
# sudo apt-get update
# sudo apt-get install -y nodejs
# npm -i 

#install nvm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
#install oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#install nvim
sudo apt install neovim
sudo apt install python-neovim
sudo apt install python3-neovim

#move dotfiles
cd ~/dev/dotfiles
cp zshrc ~/.zshrc
cp vimrc ~/.vimrc
cp tmux.conf ~/.tmux.conf
cp -r nvim_config ~/.config/nvim

nvm install --lts
npm install -g yarn
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get -y install python3.7-venv
sudo apt-get -y install build-essential cmake git libboost-all-dev libz3-dev
sudo apt-get -y install parallel
sudo apt-get -y install ripgrep
sudo apt-get -y install xclip
sudo apt-get -y install cloc
sudo apt-get -y install libyaml-dev libpython2.7-dev
sudo apt-get -y install gdb
sudo apt-get -y install cppcheck
sudo apt-get -y install clang
sudo apt-get -y install clang-3.9-dev ncurses-dev libz-dev xz-utils libpthread-workqueue-dev
sudo apt-get -y install lua5.3-dev lua5.3
sudo apt-get -y install python2
sudo apt-get -y install python2-dev
sudo apt-get -y install checkinstall
sudo apt-get -y install libtinfo5
sudo apt-get -y install ninja-build gettext libtool libtool-bin autoconf automake pkg-config unzip curl doxygen
sudo apt-get -y install ruby
sudo apt-get -y install ruby-dev
sudo apt-get -y install -y mono-complete
sudo apt-get -y install -y build-essential vim-nox
sudo apt-get -y install xsel
sudo apt-get -y install ctags
sudo apt-get -y install lazygit

# install Go
wget https://go.dev/dl/go1.17.5.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.17.5.linux-amd64.tar.gz

