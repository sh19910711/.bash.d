__docker_run() {
  local args=

  if [[ "${DOCKER_PORT}" != "" ]]; then
    args="-p ${DOCKER_PORT} ${args}"
  fi

  if [[ "${DOCKER_ENVLIST}" != "" ]]; then
    for name in ${DOCKER_ENVLIST}; do
      args="$args $(printf -- "--env=\"%s=%s\"" "$name" "${!name}")"
    done
  fi

  # echo "sudo docker run $DOCKER_OPTS ${args} $@"
  eval "sudo docker run $DOCKER_OPTS ${args} $@"
}

command() {
  if git rev-parse --git-dir 1> /dev/null; then
    command_with_git "$@"
  else
    command_on_current_dir "$@"
  fi
}

# Run command on git repository
command_with_git() {
  local opt_image
  local opt_command
  while true; do
    case $1 in
    --image)
      shift; opt_image=$1; shift ;;
    --command)
      shift; opt_command=$1; shift ;;
    *)
      break ;;
    esac
  done
  local command_name=$1; shift
  local real_command_name=${opt_command:-${command_name}}
  local image_name=${opt_image:-${command_name}}
  local git_root=$(git rev-parse --show-toplevel)
  local rel=$(realpath --relative-base "${git_root}" "$(pwd)")
  __docker_run -v ${HOME}:/home/user -u ${UID}:${GROUPS} -w "/workspace/${rel}" -e "HOME=/home/user" -v "${HOME}:/home/user" -v "${git_root}:/workspace" -ti bash_d/${image_name} $(printf " %q" ${real_command_name} "$@")
}

command_on_current_dir() {
  local opt_image
  local opt_command
  while true; do
    case $1 in
    --image)
      shift; opt_image=$1; shift ;;
    --command)
      shift; opt_command=$1; shift ;;
    *)
      break ;;
    esac
  done
  local command_name=$1; shift
  local real_command_name=${opt_command:-${command_name}}
  local image_name=${opt_image:-${command_name}}
  local root=${PWD}
  __docker_run -v ${HOME}:/home/user -u ${UID}:${GROUPS} -w "/workspace" -e "HOME=/home/user" -v "${HOME}:/home/user" -v "$root:/workspace" -ti bash_d/${image_name} $(printf " %q" ${real_command_name} "$@")
}

# Run command with GUI on git repository
gui_command_with_git() {
  local opt_image
  local opt_command
  while true; do
    case $1 in
    --image)
      shift; opt_image=$1; shift ;;
    --command)
      shift; opt_command=$1; shift ;;
    *)
      break ;;
    esac
  done
  local command_name=$1; shift
  local real_command_name=${opt_command:-${command_name}}
  local image_name=${opt_image:-${command_name}}
  local git_root=$(git rev-parse --show-toplevel)
  local rel=$(realpath --relative-base "${git_root}" "$(pwd)")
  __docker_run -P -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=${DISPLAY} -v ${HOME}:/home/user -u ${UID}:${GROUPS} -w "/workspace/${rel}" -e "HOME=/home/user" -v "${HOME}:/home/user" -v "${git_root}:/workspace" -ti bash_d/${image_name} $(printf " %q" ${real_command_name} "$@")
}
