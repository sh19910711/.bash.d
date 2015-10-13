# docker_run_with_git <container> [<command>]
docker_run_with_git() {
  local root=$(git rev-parse --show-toplevel)
  local relpath=$(realpath --relative-base ${root} $(pwd))
  sudo docker run -w /workspace/${relpath} -v ${root}:/workspace -ti $@
}
