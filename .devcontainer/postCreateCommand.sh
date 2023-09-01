# sudo apt update               # Not needed, due to the previous execution from "devcontainer.json"
# sudo apt install zsh -y       # Not needed, due to the previous execution from "devcontainer.json"
sudo apt install yadm bat -y    # yadm is a dotfiles manager git clone and bat is a cat replacement

# Install lsd (ls replacement)
cd $HOME
wget "https://github.com/Peltoche/lsd/releases/download/0.23.1/lsd_0.23.1_amd64.deb"
sudo dpkg -i lsd_0.23.1_amd64.deb
rm lsd_0.23.1_amd64.deb

# Install oh-my-zsh
sudo rm -rf ~/.oh-my-zsh    # Remove previous installation
zsh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Install powerlevel10k and clone dotfiles
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo "source ~/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc
rm .zshrc .p10k.zsh
yadm clone -b devcontainers https://github.com/caverar/dotFiles.git

# Enter the project folder
cd /workspaces/Django_Examples

# exec zsh