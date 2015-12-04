FROM base/archlinux:2015.06.01

RUN pacman --noconfirm -Sy emscripten
ENV PATH=/usr/lib/emscripten:${PATH}

RUN pacman --noconfirm -Sy base-devel
RUN pacman --noconfirm -Sy clang
RUN ln /usr/bin/python2 /usr/bin/python
ENV NODE=/usr/sbin/node

RUN pacman --noconfirm -Syu
RUN pacman -Sy --noconfirm ncurses
