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


# 修改默认Python
export PATH="$(brew --prefix python@3.11)/libexec/bin:$PATH"

# 系统预装Python
alias "python3.9"="/usr/bin/python3"
alias "trans"="~/trans -e bing"
alias "en"="trans -t en -s zh"
alias "zh"="trans -t zh -s en"
alias "ja"="trans -t ja -s zh"
alias "ls"="ls -G"
alias "ll"="ls -alhiG"
alias "s"="neofetch"
alias "c"="clear"
alias "copy"="pbcopy"
alias "lsapp"="yabai -m query --windows | grep app | sort"

# my keys
source ~/.key
source <(fzf --zsh)

# zoxide
eval "$(zoxide init zsh)"
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# MUST Be the last line
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh