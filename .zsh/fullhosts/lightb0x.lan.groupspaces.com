ZSHRC_CLASSES+=( common gui gentoo )
ZSHRC_FUNCTIONS+=( gui svn ftp irc )

path+=( /opt/bin )

my_accounts=(
  {root,retiarius}@{scaramanga.,}siterage.net
  {dave,root}@localhost
)

zstyle ':completion:*my-accounts' users-hosts $my_accounts

export DISTCC_DIR="/var/tmp/portage/.distcc"

# FTP
autoload zfinit
zfinit

# vim: ft=zsh et ts=2 sw=2
