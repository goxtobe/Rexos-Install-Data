
EOF

man inittab
man inittab(8)
man inittab8
man inittab
clear
echo "HOSTNAME=Rexos" > /etc/sysconfig/network
cat > /etc/sysconfig/clock << "EOF"
UTC=1

CLOCKPARAMS=

EOF

cat /etc/localtime 
clear
cat > /etc/sysconfig/console << "EOF"
UNICODE="1"
KEYMAP="de-latin1"
FONT="lat2a-16 -m 8859-2"

EOF

clear
cd /etc/sysconfig/
ls
cat rc.site 
cd ..
clear
locale -a
LC_ALL=es_MX.iso88591 locale charmap
LC_ALL=es_MX.iso88591 locale language
LC_ALL=es_MX.iso88591 locale charmap
LC_ALL=es_MX.iso88591 locale int_curr_symbol
LC_ALL=es_MX.iso88591 locale int_prefix
cat > /etc/profile << "EOF"
export LANG=es_MX.ISO-8859-1@MXN

EOF

clear
cat > /etc/inputrc << "EOF"
set horizontal-scroll-mode Off

set meta-flag On
set input-meta On

set convert-meta Off

set output-meta On

set bell-style none

"\eOd": backward-word
"\eOc": forward-word

"\e[1~": beginning-of-line
"\e[4~": end-of-line
"\e[5~": beginning-of-history
"\e[6~": end-of-history
"\e[3~": delete-char
"\e[2~": quoted-insert

"\eOH": beginning-of-line
"\eOF": end-of-line

"\e[H": beginning-of-line
"\e[F": end-of-line

EOF

clear
cd $LFS/sources 
clear
tar -xvf linux-3.10.tar.xz 
cd linux-3.10
clear
make mrproper
make LANG=es_MX.UTF-8 LC_ALL= menuconfig
make
make modules_install
cp -v arch/x86/boot/bzImage /boot/vmlinuz-3.10-lfs-SVN-20130711
cp -v System.map /boot/System.map-3.10
cp -v .config /boot/config-3.10
install -d /usr/share/doc/linux-3.10
cp -r Documentation/* /usr/share/doc/linux-3.10
chown -R 0:0
cd ..
rm -rvf linux-3.10
clear
install -v -m755 -d /etc/modprobe.d
cat > /etc/modprobe.d/usb.conf << "EOF"
install ohci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i ohci_hcd ; true
install uhci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i uhci_hcd ; true

EOF

cd /tmp && grub-mkrescue --output=grub-img.iso && xorriso -as cdrecord -v dev=/dev/cdrw blank=as_needed grub-img.iso
cd..
cd 
clear
cat > /boot/grub/grub.cfg << "EOF"set default=0
set timeout=5

insmod ext4
set root=(hd0,7)


menuentry "GNU/Linux, Linux 3.10-lfs-SVN-20130711" {
linux   /boot/vmlinuz-3.10-lfs-SVN-20130711 root=/dev/sda7 ro
}
EOF

cat > /boot/grub/grub.cfg << "EOF"set default=0
set timeout=5

insmod ext4
set root=(hd0,7)


menuentry "GNU/Linux, Linux 3.10-lfs-SVN-20130711" {
linux   /boot/vmlinuz-3.10-lfs-SVN-20130711 root=/dev/sda7 ro
}
EOF


EOF

clear
cat > /boot/grub/grub.cfg << "EOF"set default=0
set timeout=5

insmod ext4
set root=(hd0,7)


menuentry "GNU/Linux, Linux 3.10-lfs-SVN-20130711" {
linux   /boot/vmlinuz-3.10-lfs-SVN-20130711 root=/dev/sda7 ro
}
EOF


EOF



clear
echo SVN-20130711 > /etc/lfs-release
cat > /etc/lsb-release << "EOF"
DISTRIB_ID="Linux From Scratch"
DISTRIB_RELEASE="SVN-20130711 Rexos"
DISTRIB_CODENAME="EXOFT"
DISTRIB_DESCRIPTION="Linux From Scratch Rexos Version"
EOF

clear
logout
clear
cd /tmp && grub-mkrescue --output=grub-img.iso && xorriso -as cdrecord -v dev=/dev/cdrw blank=as_needed grub-img.iso
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
clear
cd /
clear
grub-setup '/dev/sda'
clear
shutdown -hP now
clear
cd /sources/
clear
tar -xvf linux-3.10.tar.xz 
clear
make mrproper
cd linux-3.10
make mrproper
make LANG=es_MX LC_ALL= menuconfig
make
make modules_install
cp -v arch/x86/boot/bzImage /boot/vmlinuz-3.10-lfs-SVN-20130711
cp -v System.map /boot/System.map-3.10
cp -v .config /boot/config-3.10
install -d /usr/share/doc/linux-3.10
cp -r Documentation/* /usr/share/doc/linux-3.10
install -v -m755 -d /etc/modprobe.d
cat > /etc/modprobe.d/usb.conf << "EOF"
install ohci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i ohci_hcd ; true
install uhci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i uhci_hcd ; true

EOF

logouy
logout
lear
clear
ls
clear
cd /
clear
ls
iwconfig
ifconfig
clear
ls
cd etc/
clear
ls
cd ..
clear
ls
clear
elinks
clear
ls
clear
sl
clear
ls
clear
exit
clear
ls
clear
exit
clear
ls
cd etc/
ls
cd skel/
ls
clear
ls
clear
cat > .bash_logout << "EOF"

EOF

ls
ls -a
clear
ls -a
cat > .bashrc << "EOF"


if [ -f "/etc/bashrc" ] ; then
  source /etc/bashrc
fi

EOF

clear
ls -a
cat > .bash_profile << "EOF"


append () {
  local IFS=':'
  local NEWPATH
  for DIR in $PATH; do
     if [ "$DIR" != "$1" ]; then
       NEWPATH=${NEWPATH:+$NEWPATH:}$DIR
     fi
  done

  export PATH=$NEWPATH:$1
}

if [ -f "$HOME/.bashrc" ] ; then
  source $HOME/.bashrc
fi

if [ -d "$HOME/bin" ] ; then
  append $HOME/bin
fi

unset append

EOF

clear
ls -a
clear
cat > /etc/bashrc << "EOF"



alias ls='ls --color=auto'


NORMAL="\[\e[0m\]"
RED="\[\e[1;31m\]"
GREEN="\[\e[1;32m\]"
if [[ $EUID == 0 ]] ; then
  PS1="$RED\u [ $NORMAL\w$RED ]# $NORMAL"
else
  PS1="$GREEN\u [ $NORMAL\w$GREEN ]\$ $NORMAL"
fi

EOF

clear
ls
ls -a
cd ..
clear
ls
cd ..
clear
cat > /etc/profile << "EOF"


pathremove () {
        local IFS=':'
        local NEWPATH
        local DIR
        local PATHVARIABLE=${2:-PATH}
        for DIR in ${!PATHVARIABLE} ; do
                if [ "$DIR" != "$1" ] ; then
                  NEWPATH=${NEWPATH:+$NEWPATH:}$DIR
                fi
        done
        export $PATHVARIABLE="$NEWPATH"
}

pathprepend () {
        pathremove $1 $2
        local PATHVARIABLE=${2:-PATH}
        export $PATHVARIABLE="$1${!PATHVARIABLE:+:${!PATHVARIABLE}}"
}

pathappend () {
        pathremove $1 $2
        local PATHVARIABLE=${2:-PATH}
        export $PATHVARIABLE="${!PATHVARIABLE:+${!PATHVARIABLE}:}$1"
}


export PATH=/bin:/usr/bin

if [ $EUID -eq 0 ] ; then
        pathappend /sbin:/usr/sbin
        unset HISTFILE
fi

export HISTSIZE=1000
export HISTIGNORE="&:[bf]g:exit"

NORMAL="\[\e[0m\]"
RED="\[\e[1;31m\]"
GREEN="\[\e[1;32m\]"
if [[ $EUID == 0 ]] ; then
  PS1="$RED\u [ $NORMAL\w$RED ]# $NORMAL"
else
  PS1="$GREEN\u [ $NORMAL\w$GREEN ]\$ $NORMAL"
fi

for script in /etc/profile.d/*.sh ; do
        if [ -r $script ] ; then
                . $script
        fi
done

unset pathremove pathprepend pathappend

EOF

clear
install --directory --mode=0755 --owner=root --group=root /etc/profile.d
cat > /etc/profile.d/dircolors.sh << "EOF"if [ -f "/etc/dircolors" ] ; then
        eval $(dircolors -b /etc/dircolors)

        if [ -f "$HOME/.dircolors" ] ; then
                eval $(dircolors -b $HOME/.dircolors)
        fi
fi
alias ls='ls --color=auto'
EOF

clear
cat > /etc/profile.d/extrapaths.sh << "EOF"
if [ -d /usr/local/lib/pkgconfig ] ; then
        pathappend /usr/local/lib/pkgconfig PKG_CONFIG_PATH
fi
if [ -d /usr/local/bin ]; then
        pathprepend /usr/local/bin
fi
if [ -d /usr/local/sbin -a $EUID -eq 0 ]; then
        pathprepend /usr/local/sbin
fi

if [ -d ~/bin ]; then
        pathprepend ~/bin
fi
EOF

clear
cat > /etc/profile.d/readline.sh << "EOF"if [ -z "$INPUTRC" -a ! -f "$HOME/.inputrc" ] ; then
        INPUTRC=/etc/inputrc
fi
export INPUTRC
EOF

clear
cat > /etc/profile.d/umask.sh << "EOF"if [ "$(id -gn)" = "$(id -un)" -a $EUID -gt 99 ] ; then
  umask 002
else
  umask 022
fi
EOF

clear
cat > /etc/profile.d/i18n.sh << "EOF"
locale -a
LC_ALL=es_MX.iso88591 locale charmap
clear
cd /etc/
ls
cat profile
clear
cat > /etc/profile.d/i18n.sh << "EOF"export LANG=es_MX.utf8@MX
EOF

clear
ls
cat bashrc 
clear
ls
cd skel/
ls
clear
ls -a
clear
cd ..
clear
ls
clear
dircolors -p > /etc/dircolors
clear
cd ..
clear
ls
clear
cat /etc/profile
clear
ls
cd etc/profile.d/
ls
cd ..
clear
ls
clear
ls
cd skel/
clear
ls
ls -a
cd
clear
ls
cd /etc/
ls
cd skel/
clear
ls
clear
ls -a
clear
ls
clear
vim .vimrc
ls
ls -a
clear
cd ..
cd issue
clear && ls
vim issue
ls
vim issue
clear
ls
clear > /etc/issue 
clear
cat issue 
clear
cat > /etc/shells << "EOF"
/bin/sh
/bin/bash

EOF

clear
cd ..
cd sources/
clear
ls
clear
ls
logout
for package in $(grep -v '^#' ../proto-7.7.md5 | awk '{print $2}'); do   packagedir=${package%.tar.bz2};   tar -xf $package;   pushd $packagedir;   ./configure $XORG_CONFIG;   as_root make install;   popd;   rm -r $packagedir; done
for package in $(grep -v '^#' ../lib-7.7.md5 | awk '{print $2}'); do   packagedir=${package%.tar.bz2};   tar -xf $package;   pushd $packagedir;   case $packagedir in     libXfont-[0-9]* )       ./configure $XORG_CONFIG --disable-devel-docs;     ;;     libXt-[0-9]* )       ./configure $XORG_CONFIG                   --with-appdefaultdir=/etc/X11/app-defaults;     ;;     * )       ./configure $XORG_CONFIG;     ;;   esac;   make;   make install;   popd;   rm -r $packagedir;   /sbin/ldconfig; done
cd /
cd sources/
cd lib
clear
for package in $(grep -v '^#' ../lib-7.7.md5 | awk '{print $2}'); do   packagedir=${package%.tar.bz2};   tar -xf $package;   pushd $packagedir;   case $packagedir in     libXfont-[0-9]* )       ./configure $XORG_CONFIG --disable-devel-docs;     ;;     libXt-[0-9]* )       ./configure $XORG_CONFIG                   --with-appdefaultdir=/etc/X11/app-defaults;     ;;     * )       ./configure $XORG_CONFIG;     ;;   esac;   make;   as_root make install;   popd;   rm -r $packagedir;   as_root /sbin/ldconfig; done
halt
ifconfig
iwconfig
clear
logout
clea
shutdown]
shutdown
logout
iwconfig
clear
shutdown -hP now
iwconfig
clear
ifconfig
clear
ls
clear
exot
vim ifconfig.sit0
clear
ls
ifconfig
reboot
