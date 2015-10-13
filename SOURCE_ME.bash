source_me() {
  local root=$(dirname ${BASH_SOURCE})
  for f in $(find ${root} -type f -name '*.bash'); do
    if [[ "$(basename ${f})" != "$(basename ${BASH_SOURCE})" ]]; then
      source ${f}
    fi
  done
}

source_me
