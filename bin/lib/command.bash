# run command on git repository
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
  echo cmd: $(printf " %q" ${real_command_name} "$@")
  sudo docker run -v ${HOME}:/home/user -u ${UID}:${GROUPS} -w "/workspace/${rel}" -e "HOME=/home/user" -v "${HOME}:/home/user" -v "${git_root}:/workspace" -ti .bash.d/${image_name} $(printf " %q" ${real_command_name} "$@")
}
