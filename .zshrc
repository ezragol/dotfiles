# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ezra/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U colors
colors
PS1="%{$fg_bold[blue]%}%n%{$reset_color%} %{$fg_bold[green]%}%~%{$reset_color%}%# "

alias i3conf="nano ~/.config/i3/config"
alias conkyconf="nano ~/.config/conky/conky.conf"
alias alaconf="nano ~/.alacritty.toml"
alias piconf="nano ~/.config/picom/picom.conf"
alias cdi3="cd ~/.config/i3"
alias neo="clear && echo \"\\n\" && neofetch"
alias f="fff"
