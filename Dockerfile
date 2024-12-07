FROM archlinux:latest
RUN set -xe \
    && pacman-key --init \
    && pacman -Syu --noconfirm \
    && pacman -S --noconfirm --needed base-devel git zsh vim tmux bat fd unzip lsd curl wget hexyl nodejs npm gist fzf python python-pip python-setuptools python-pipx python-pillow python-colorama bpython asciiquarium banner catimg cmatrix figlet jp2a letterpress nyancat toilet sl emacs screenfetch cowsay fortune-mod ponysay docker

# ENV TZ=Asia/Seoul
# RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    #  && echo $TZ > /etc/timezone

RUN set -xe \ 
    && useradd -m -p "\$6\$ZEHyOJAy\$697kSQRpVsSnvU4oDl6BtR1LDrHltFPoqvdMJd9Bc0Msfz./iExfCcm7fxt7ZBzOKxAFCpdaj7aTzayT1L.pf/" -s /usr/bin/zsh ccsss \
    && echo "ccsss ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ccsss \
    && chmod 0440 /etc/sudoers.d/ccsss

USER ccsss:ccsss
WORKDIR /home/ccsss

RUN cd ~ \
    && git clone https://aur.archlinux.org/paru.git && cd paru \
    && makepkg -si --noconfirm \
    && paru --gendb && paru -Sua && paru -Syu --devel 

RUN git clone -q https://github.com/ccss17/dotfiles && cd dotfiles \
    && ./install.sh 

CMD /usr/bin/zsh