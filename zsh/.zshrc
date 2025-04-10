# Show path in session title if zsh is open in iTerm2
if [ $ITERM_SESSION_ID ]; then
precmd() {
  echo -ne "\033]0;${PWD##*/}\007"
}
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# 添加docker以及其他自动补全
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$HOME/.docker/completions:$FPATH
  autoload -Uz compinit
  compinit
fi
# 自动补全样式
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}[ %d ]%f'

# p10k 主题
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# my keys
source ~/.key
source <(fzf --zsh)
# 系统预装Python
alias "python3.9"="/usr/bin/python3"
alias "trans"="~/trans -e bing"
alias "en"="trans -t en -s zh"
alias "zh"="trans -t zh -s en"
alias "ja"="trans -t ja -s zh"
alias "ls"="gls --color=auto --group-directories-first"
alias "ll"="ls -althiG"
alias "s"="neofetch"
alias "c"='echo -e "\033c"' # fake clear
alias "copy"="pbcopy"
alias "lsapp"="yabai -m query --windows | grep app | sort"
alias "chrome"="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222"
alias "bark"="bash ~/bark.sh"
# easy connect
alias "unload_easy"="sudo launchctl unload /Library/LaunchDaemons/com.sangfor.EasyMonitor.plist && echo off > ~/easy.status"
alias "load_easy"="sudo launchctl load /Library/LaunchDaemons/com.sangfor.EasyMonitor.plist && echo on > ~/easy.status"
# zoxide
eval "$(zoxide init zsh)"
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# MUST Be the last line
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

