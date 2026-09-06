# Created by newuser for 5.9

export CARGO_HOME="$HOME/.config/cargo"
export GNUPGHOME="$HOME/.config/gnupg"
export ZDOTDIR="$HOME/.config/zsh"
export TERMINAL="foot"
export WINEPREFIX="$HOME/.config/wineprefixes/wineproton"
#
# Luke's config for the Zoomer Shell

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[magenta]%}[%{$fg[magenta]%}%n%{$fg[white]%}@%{$fg[white]%}%M %{$fg[white]%}%~%{$fg[magenta]%}]%{$reset_color%}$%b "

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.config/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
# lfcd () {
#    tmp="$(mktemp)"
#    lf -last-dir-path="$tmp" "$@"
#    if [ -f "$tmp" ]; then
#        dir="$(cat "$tmp")"
#        rm -f "$tmp"
#        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
#    fi
#}
#bindkey -s '^o' 'lfcd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias mgmdbuild="dotnet build ~/MagnificusMod && mv ~/MagnificusMod/bin/Debug/netstandard2.0/MagnificusMod.dll ~/Inscryption/game/BepInEx/plugins"
alias update-grub="doas grub-mkconfig -o /boot/grub/grub.cfg"
alias mgmdclear="rm ~/Inscryption/game/BepInEx/plugins/MagnificusMod.dll"
alias emerge="doas emerge"
alias umu-run="WINEPREFIX=/home/evan/.config/wineprefixes/umu umu-run"
alias librewolf="librewolf-bin"

alias rm="trash-put"
alias emergeupd="doas snapper -c root create -c number --description Pre-Upd && doas emaint -a sync && emerge -avuDN @world"
#alias makekernel="su - && cd /usr/src/linux && make -j4 && make modules_install && make install && cd /usr/src/rtl88x2bu-git && dkms autoinstall -k "
#alias yayupd='sudo timeshift --create --comments "pre upd" --tags D && yay && flatpak upgrade'

fastfetch


source /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh
