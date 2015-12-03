# fake git-clone
clone() {
  local url="$@" # https://github.com/foo/bar
  wget -O - ${url}/archive/master.tar.gz | tar -C . -z -x -f -
}
