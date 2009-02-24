ZSHRC_CLASSES+=( common )
ZSHRC_FUNCTIONS+=( svn )

my_accounts=(
  dave@{bb.dmi.me.uk,blackb0x.zapto.org}
)

zstyle ':completion:*my-accounts' users-hosts $my_accounts

# vim: ft=zsh et ts=2 sw=2
