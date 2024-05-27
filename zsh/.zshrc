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

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

alias "trans"="~/trans -e google"
alias "en"="trans -t en -s zh"
alias "zh"="trans -t zh -s en"
alias "ja"="trans -t ja -s zh"
alias "python"="/opt/homebrew/bin/python3.11"
alias "python3"="/opt/homebrew/bin/python3.11"
alias "pip"="/opt/homebrew/bin/python3.11 -m pip"
alias "python3.11"="$(brew --prefix python@3.11)/libexec/bin/python"
alias "python3.12"="$(brew --prefix python@3.12)/libexec/bin/python"
alias "python3.9"="/usr/bin/python3"
alias "ls"="ls -G"
alias "ll"="ls -alhiG"
alias "s"="neofetch"
alias "c"="clear"
alias "copy"="pbcopy"
export JUPYTERLAB_DIR="/opt/homebrew/share/jupyter/lab"
export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890

eval "$(zoxide init zsh)"
# MUST Be the last line
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
