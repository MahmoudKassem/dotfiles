# history settings
HISTFILE=~/.cache/histfile
HISTSIZE=16384
SAVEHIST=16384

#enable opening folders directly
setopt autocd nomatch

#enable vi modes
bindkey -v

#enable menu auto complete suggestion including hidden files
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)
compinit

#aliases
alias syu="doas -- pacman -Syu && update-aur-packages.sh"
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
