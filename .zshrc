# base ZSH file directory
ZSHDIR="${HOME}/.zsh"

# require utility functions
. "$ZSHDIR/util"

typeset -Ua ZSHRC_CLASSES
typeset -Ua ZSHRC_FUNCTIONS

ZSHRC_CLASSES=( common )
ZSHRC_FUNCTIONS=( misc zsh )

print_trace "Classes: ${ZSHRC_CLASSES[*]}"
print_trace "Functions: ${ZSHRC_FUNCTIONS[*]}"

# Add host/domain specific zshrc
print_trace "Before domain-specific"

# check all domain components
local d1=$(hostname -d) d2='' thishost=$( hostname -s ) thisfullhost=$( hostname -f )
while [[ "$d1" != "${d1#*.}" ]]; do
  d2="${d1##*.}${d2:+.}${d2}"
  d1="${d1%.*}"
  print_trace "Before domain $d2"
  [[ -f "$ZSHDIR/domains/$d2" ]] && . "$ZSHDIR/domains/$d2"
done
print_trace "Before domain $d1${d2:+.}$d2"
[[ -n "$d1" ]] && [[ -f "$ZSHDIR/domains/$d1${d2:+.}$d2" ]] && . "$ZSHDIR/domains/$d1${d2:+.}$d2"

print_trace "Before host-specific: ${thishost}"
[[ -f "$ZSHDIR/hosts/${thishost}" ]]     && . "$ZSHDIR/hosts/${thishost}"
print_trace "Before fullhost-specific: ${thisfullhost}"
[[ -f "$ZSHDIR/fullhosts/${thisfullhost}" ]] && . "$ZSHDIR/fullhosts/${thisfullhost}"

print_trace "Final classes: ${ZSHRC_CLASSES[*]}"
print_trace "Final functions: ${ZSHRC_FUNCTIONS[*]}"

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
