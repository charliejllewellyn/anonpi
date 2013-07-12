#!/bin/bash

# Script to create a raspberry pi anonymising gateway.

if [ ${UID} != 0 ]
then
	echo "You must be root"
fi

# Now remove some software we won't be using
apt-get --purge --yes remove lxde lxappearance lxsession-edit lxterminal lxtask lxshortcut lxpanel lxsession lxrandr lxpolkit lxde-common lxde-icon-theme lxinput lxmenu-data xserver-common xserver-xorg xserver-xorg-core xserver-xorg-input-all xserver-xorg-input-evdev xserver-xorg-input-synaptics xserver-xorg-video-fbdev zenity zenity-common xpdf  alsa-base alsa-utils lightdm xinit samba-common smbclient dillo xterm rsync omxplayer weston cups-bsd cups-client fonts-droid ghostscript lesstif2 libaudit0 libcupsimage2 libfile-copy-recursive-perl libfm-data libgail-3-0 libgs9 libgs9-common libijs-0.35 libjavascriptcoregtk-3.0-0 libjbig2dec0 liblightdm-gobject-1-0 libmenu-cache1 libmtdev1 libopenjpeg2 libpaper-utils libpaper1 libpciaccess0 libpoppler19 libqt4-network libqt4-xml libqtdbus4 libqtwebkit4 libsamplerate0 libwayland0 libwebkitgtk-3.0-0 libwebkitgtk-3.0-common libwnck-common libwnck22 libxcb-xfixes0 libxkbcommon0 libxkbfile1 libxklavier16 libxp6 libxres1 lightdm-gtk-greeter poppler-data poppler-utils squeak-plugins-scratch update-inetd x11-xkb-utils fuse libasound2 libasyncns0 libcaca0 libdirectfb-1.2-9 libflac8 libfuse2 libgif4 libid3tag0 libjson0 libmad0 libmikmod2 libogg0 libportmidi0 libsndfile1 libts-0.0-0 libvorbis0a libvorbisenc2 libvorbisfile3 libwebp2 python-numpy python-support tsconf blt console-setup consolekit dbus-x11 desktop-base desktop-file-utils galculator gconf2 gksu glib-networking gnome-accessibility-themes gnome-icon-theme gnome-themes-standard gnome-themes-standard-data gpicview gsettings-desktop-schemas gsfonts gsfonts-x11 gtk2-engines gvfs gvfs-backends gvfs-common gvfs-daemons gvfs-fuse gvfs-libs idle idle-python2.7 idle-python3.2 idle3 leafpad libaudio2 libcairo-gobject2 libcairo2 libgail18 libgd2-xpm libgdk-pixbuf2.0-0 libgdu0 libgksu2-0 libgl1-mesa-glx libglade2-0 libgnome-keyring-common libgnome-keyring0 libgphoto2-2 libgtk-3-0 libgtk-3-bin libgtk-3-common libgtk2.0-0 libgtk2.0-bin libgtk2.0-common libice6 libimlib2 libjavascriptcoregtk-1.0-0 libnotify4 libobrender27 libobt0 libpango1.0-0 libpulse0 libqt4-svg libqtcore4 libqtgui4 librsvg2-2 librsvg2-common libsdl-image1.2 libsdl-mixer1.2 libsdl-ttf2.0-0 libsdl1.2debian libsm6 libsmpeg0 libsoup-gnome2.4-1 libsoup2.4-1 libstartup-notification0 libunique-1.0-0 libwebkitgtk-1.0-0 libwebkitgtk-1.0-common libx11-6 libx11-data libx11-xcb1 libxaw7 libxcb-glx0 libxcb-render0 libxcb-shape0 libxcb-shm0 libxcb-util0 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxfont1 libxft2 libxi6 libxinerama1 libxmu6 libxmuu1 libxpm4 libxrandr2 libxrender1 libxss1 libxt6 libxtst6 libxv1 libxxf86dga1 libxxf86vm1 midori netsurf-gtk obconf openbox penguinspuzzle policykit-1 python-pygame python-tk python3-tk shared-mime-info smartsim tcl8.5 tk8.5 wpagui x11-common x11-utils x11-xserver-utils xarchiver xauth xdg-utils xfonts-encodings xfonts-utils xkb-data aspell aspell-en console-setup-linux cups-common dconf-gsettings-backend dconf-service dictionaries-common fontconfig fontconfig-config fonts-freefont-ttf gconf-service gconf2-common glib-networking-common glib-networking-services hicolor-icon-theme iso-codes libarchive12 libaspell15 libatk1.0-0 libatk1.0-data libavahi-client3 libavahi-common-data libavahi-common3 libavahi-glib1 libbluetooth3 libbluray1 libcdio-cdda1 libcdio-paranoia1 libcdio13 libck-connector0 libcolord1 libcroco3 libcups2 libdatrie1 libdconf0 libdrm2 libenchant1c2a libexif12 libfontconfig1 libfontenc1 libgconf-2-4 libgdk-pixbuf2.0-common libgeoclue0 libglapi-mesa libgphoto2-port0 libgstreamer-plugins-base0.10-0 libgstreamer0.10-0 libgtop2-7 libgtop2-common libhunspell-1.3-0 libicu48 libimobiledevice2 libjasper1 libjpeg8 liblcms1 liblcms2-2 libltdl7 libmng1 libnettle4 liborc-0.4-0 libpam-ck-connector libpixman-1-0 libplist1 libpolkit-agent-1-0 libpolkit-backend-1-0 libproxy0 libsmbclient libtalloc2 libtdb1 libthai-data libthai0 libtiff4 libusbmuxd1 libwbclient0 libxau6 libxdmcp6 libxml2 libxslt1.1 netsurf-common sgml-base ttf-dejavu-core usbmuxd xml-core

if [ -d /etc/X11 ]
  then
  rm -rf /etc/X11
fi
if [ -d /etc/sgml ]
  then
  rm -rf /etc/sgml  
fi

# Let's update everything else
apt-get update
apt-get --yes upgrade

# And add some that we will be using
apt-get install --yes libevent-dev vim libssl-dev

# And tidy up after ourselvs
apt-get --purge --yes autoremove
apt-get autoclean

useradd tor

cd /usr/local/src
curl -o https://www.torproject.org/dist/tor-0.2.3.25.tar.gz
tar zxf tor-0.2.3.25.tar.gz
cd tor-0.2.3.25
make clean
make distclean
./configure --disable-asciidoc
make
make install

if [ ! -d /usr/local/tor]
  then
  mkdir /usr/local/tor
fi
chown tor:root /usr/local/tor
mount -t tmpfs -o size=30m tmpfs /usr/local/tor
echo "tmpfs /usr/local/tor tmpfs defaults,size=20m,mode=7777 0 0" >> /etc/fstab

(echo "User tor
RunAsDaemon 1
DataDirectory /usr/local/tor/data


TransPort 0.0.0.0:4050
DNSPort 0.0.0.0:53
AutomapHostsOnResolve 1
VirtualAddrNetwork 10.22.0.0/16") > /usr/local/etc/tor/torrc

iptables -t nat -A PREROUTING -i eth0 -p udp -m udp --dport 4050 -j REDIRECT --to-ports 4050
iptables -t nat -A PREROUTING -i eth0 -p tcp --syn -j REDIRECT --to-ports 4050
iptables-save > /etc/network/firewall.conf

(echo '#!/bin/bash
/sbin/iptables-restore < /etc/network/firewall.conf') > /etc/network/if-pre-up.d/firewall
chmod +x /etc/network/if-pre-up.d/firewall

(grep -v exit /etc/rc.local ; echo /usr/local/bin/tor; echo exit 0) > /etc/rc.local.new
mv /etc/rc.local.new /etc/rc.local
