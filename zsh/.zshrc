if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export PATH="${PATH}:${HOME}/.local/bin/"
export ZSH="$HOME/.oh-my-zsh"
CLOUD="☁"
NAME="BRONXX"

PROMPT='\$ %{$fg_bold[cyan]%}$NAME %{$fg_bold[green]%} %{$fg[green]%}%c %{$fg_bold[blue]%} % %{$reset_color%}'

RPROMPT='%{$fg_bold[cyan]%}$CLOUD  %{$fg_bold[cyan]%}$(git_prompt_info) $(date) %{$reset_color%}'

#ZSH_THEME="cloud"

plugins=(git zsh-z python tmux)

source $ZSH/oh-my-zsh.sh

alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias ll="ls -la"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias cg="git checkout"
alias gb="git branch"
alias df="cd $HOME/.dotfiles"
alias e="exit"
alias cls="clear"
alias tc="nvim ~/.tmux.conf"
alias zc="nvim ~/.zshrc"
alias nc="nvim ~/.config/nvim/init.lua"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias explorer="explorer.exe"
alias subl="subl.exe"
alias chrome="chrome.exe"
alias lsc="colorls --group-directories-first"
alias sc="source $HOME/.zshrc"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export NVM_DIR="$HOME/.nvm"
export ANDROID_HOME="/mnt/c/users/dell/appdata/local/android/sdk"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
