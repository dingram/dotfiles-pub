# base ZSH file directory
ZSHDIR="${HOME}/.zsh"

typeset -Ua ZSHRC_CLASSES
typeset -Ua ZSHRC_FUNCTIONS

ZSHRC_CLASSES=( common )
ZSHRC_FUNCTIONS=( misc zsh )

# Add host/domain specific zshrc
[[ -f $ZSHDIR/fullhosts/$(hostname -f) ]] && . $ZSHDIR/fullhosts/$(hostname -f)
[[ -f $ZSHDIR/hosts/$(hostname -s) ]]     && . $ZSHDIR/hosts/$(hostname -s)
[[ -f $ZSHDIR/domains/$(hostname -d) ]]   && . $ZSHDIR/domains/$(hostname -d)

# load classes and functions
for c in "${ZSHRC_CLASSES[@]}"; do
  [[ -f "$ZSHDIR/classes/$c" ]] && . "$ZSHDIR/classes/$c" || echo "Could not load class $c"
done

# load classes and functions
for f in "${ZSHRC_FUNCTIONS[@]}"; do
  [[ -f "$ZSHDIR/functions/$f" ]] && . "$ZSHDIR/functions/$f" || echo "Could not load function library $f"
done


# keybindings - vim keymap
bindkey -v
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^[[3~' delete-char
bindkey '^[[6~' end-of-history
bindkey '^[.' insert-last-word
bindkey '^[p' push-input
case $TERM in (xterm*)
  bindkey '\eOH' beginning-of-line
  bindkey '\eOF' end-of-line
esac
# I like ^D to exit my terminal
bindkey -r '^D'
stty eof '^D'

# Print some stuff
chpwd
if [[ -x `which date` ]]; then
  date
fi

# vim: ft=zsh et ts=2 sw=2
