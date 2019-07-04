FROM archlinux/base
ENV S6_KEEP_ENV=1
ADD root/ /
RUN \
    set -xe; \
    cd /var/tmp; \
    locale-gen; \
    pacman -Syu --noconfirm; \
    pacman -S --noconfirm arc-gtk-theme awk aws-cli binutils docker docker-compose fakeroot fcitx-im fcitx-mozc file firefox firefox-i18n-ja git gnome-system-monitor jshon neofetch noto-fonts noto-fonts-cjk openssh papirus-icon-theme pluma tar tigervnc tmux vim wget xfce4 xfce4-whiskermenu-plugin zsh; \
    wget https://github.com/just-containers/s6-overlay/releases/download/v1.22.1.0/s6-overlay-amd64.tar.gz; \
    tar xvf s6-overlay-amd64.tar.gz; \
    set +e; \
    cp -rf ./bin/* /usr/bin/; \
    cp -rf ./etc/* /etc/; \
    cp -rf ./libexec /; \
    cp -rf ./usr/* /usr/; \
    cp -rf ./init /opt/bin/init; \
    set -e; \
    wget https://raw.githubusercontent.com/oshazard/apacman/master/apacman; \
    chmod +x apacman; \
    ./apacman -S --noconfirm yay-bin; \
    rm -rf  ./* /usr/share/man/* /var/cache/pacman/pkg/* /var/lib/pacman/sync/* /etc/pacman.d/mirrorlist.pacnew; \
    groupadd -f wheel; \
    mkdir /home/_; \
    cd /home/_; \
    git clone https://github.com/mohemohe/dotfiles.git .dotfiles; \
    /usr/bin/env __DOTFILES="/home/_/.dotfiles" HOME="/home/_" CI="1" "/home/_/.dotfiles/_init.sh"
ENTRYPOINT ["/opt/bin/init"] 
CMD ["/opt/bin/login"]