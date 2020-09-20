# history settings
HISTFILE=~/.cache/histfile
HISTSIZE=16384
SAVEHIST=16384

#enable opening folders directly
setopt autocd nomatch

#enable vi modes
bindkey -v

#enable backwards search
bindkey "^R" history-incremental-search-backward

#enable menu auto complete suggestion including hidden files
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)
compinit

#aliases
alias aur='update-git-repos-in-directory.sh "AUR packages" "$(find $HOME/aur/* -maxdepth 0 -type d)" "makepkg -sirc"'
alias npu='update-git-repos-in-directory.sh "NeoVim plugins" "$(find $HOME/.local/share/nvim/site/pack/plugins/opt/* -maxdepth 0 -type d)" "true"'
alias syu='doas -- pacman -Syu && aur && npu'
alias ls="ls -A --color=auto"

#load plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

#load starship prompt
eval "$(starship init zsh)"

#load direnv
eval "$(direnv hook zsh)"

#show systeminfo
neofetch
