ZSHRC_CLASSES+=( common )
ZSHRC_FUNCTIONS+=( svn )

my_accounts=(
  dmi@gs-{db1,dev1,mail1,mail2,db}
)

zstyle ':completion:*my-accounts' users-hosts $my_accounts

# vim: ft=zsh et ts=2 sw=2
