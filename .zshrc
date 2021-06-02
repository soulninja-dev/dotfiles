export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="archcraft"

plugins=(git npm flutter archlinux node dotenv zsh-autosuggestions zsh-syntax-highlighting)


source $ZSH/oh-my-zsh.sh

alias zshconfig="geany ~/.zshrc"
alias ohmyzsh="thunar ~/.oh-my-zsh"

# ls
alias l='ls -lh'
alias ll='ls -lah'
alias la='ls -cA'
alias lm='ls -m'
alias lr='ls -R'
alias lg='ls -l --group-directories-first'

# git
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push origin master'

lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
     dir="$(cat "$tmp")"
     rm -f "$tmp"
       [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'
nerdfetch
