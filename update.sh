rm -rf ./zsh
rm -rf ./sketchybar
rm -rf ./hammerspoon
rm -rf ./neofetch
rm -rf ./fish

mkdir ./hammerspoon
cp ~/.hammerspoon/init.lua ./hammerspoon/init.lua

mkdir zsh
cp ~/.zshrc ./zsh/.zshrc
cp ~/.p10k.zsh ./zsh/.p10k.zsh
rsync -a --exclude=".git" ~/.config/sketchybar/ ./sketchybar
rsync -a --exclude=".git" ~/.config/neofetch/ ./neofetch
rsync -a --exclude=".git" ~/.config/fish/ ./fish