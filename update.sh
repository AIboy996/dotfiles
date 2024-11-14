rm -rf ./zsh
rm -rf ./sketchybar
rm -rf ./hammerspoon

mkdir ./hammerspoon
cp ~/.hammerspoon/init.lua ./hammerspoon/init.lua

mkdir zsh
cp ~/.zshrc ./zsh/.zshrc
cp ~/.p10k.zsh ./zsh/.p10k.zsh
rsync -a --exclude=".git" ~/.config/sketchybar/ ./sketchybar