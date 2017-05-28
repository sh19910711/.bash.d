source_me() {
  local root=$(dirname ${BASH_SOURCE})
  source ${root}/src/bashrc
  for f in $(find ${root}/extsrc ${root}/src -type f -name '*.bash'); do
    if [[ "$(basename ${f})" != "$(basename ${BASH_SOURCE})" ]]; then
      source ${f}
    fi
  done
}

source_me
