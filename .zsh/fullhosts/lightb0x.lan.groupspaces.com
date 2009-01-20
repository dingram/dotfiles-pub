ZSHRC_CLASSES+=( common gui gentoo )
ZSHRC_FUNCTIONS+=( gui svn ftp irc )

path+=( /opt/bin )
path=( /usr/lib/colorgcc/bin $path )

my_accounts=(
  {root,retiarius}@{scaramanga.,}siterage.net
  {root,dmi,retiarius}@{scaramanga.,}siterage.net
  dmi@heeps.union.ic.ac.uk
  dmi@dev2.clickuni.com
  dmi@gslocal
  dave@{bb.dmi.me.uk,blackb0x.zapto.org}
  {dave,root}@localhost
)

zstyle ':completion:*my-accounts' users-hosts $my_accounts

export DISTCC_DIR="/var/tmp/portage/.distcc"

# FTP
autoload zfinit
zfinit

# vim: ft=zsh et ts=2 sw=2
