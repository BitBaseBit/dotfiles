sudo apt-get update
sudo apt-get install -y gcc
sudo apt-get install -y g++ 
sudo apt-get install python3-dev
sudo apt-get install build-essential 

for i in gcc g++ python3-dev build-essential openjdk-11-jdk; do
    sudo apt-get install -y $i
done

curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

wget https://golang.org/dl/go1.16.4.linux-amd64.tar.gz
sudo tar -xvf go1.16.4.linux-amd64.tar.gz
echo "export PATH=$PATH:~/go/bin" > ~/.bashrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir ~/dev && cd ~/dev
sudo chown ubuntu:ubuntu ~/dev

wget https://github.com/ethereum/go-ethereum/archive/refs/tags/v1.10.3.tar.gz
tar -xvf v1.10.3.tar.gz

