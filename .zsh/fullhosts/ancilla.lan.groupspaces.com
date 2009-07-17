ZSHRC_CLASSES+=( common gentoo )
ZSHRC_FUNCTIONS+=( svn )

my_accounts=(
  dmi@dev.groupspaces.com
  dmi@gslocal
  dave@{bb.dmi.me.uk,blackb0x.zapto.org}
)

zstyle ':completion:*my-accounts' users-hosts $my_accounts

# vim: ft=zsh et ts=2 sw=2
