FROM ubuntu:14.04

RUN apt-get -y update
RUN apt-get install -y clang-3.4 llvm-3.4
RUN apt-get install -y emscripten
RUN apt-get install -y build-essential
RUN apt-get install -y wget
RUN apt-get install -y m4

RUN mkdir /tmp/bison
WORKDIR /tmp/bison
ADD bison-3.0.4.tar.xz.sig /tmp/bison
ADD gnu-keyring.gpg /tmp/bison
RUN gpg --import gnu-keyring.gpg && \
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 78D5264E
RUN wget http://ftp.gnu.org/gnu/bison/bison-3.0.4.tar.xz && \
  gpg --verify bison-3.0.4.tar.xz.sig
RUN tar xf bison-3.0.4.tar.xz
RUN cd bison-3.0.4 && ./configure && make && make install
