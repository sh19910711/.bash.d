# docker_run_with_git <container> [<command>]
docker_run_with_git() {
  local root=$(git rev-parse --show-toplevel)
  local relpath=$(realpath --relative-base ${root} $(pwd))
  sudo docker run -u ${UID}:${GID} -w /workspace/${relpath} -v ${root}:/workspace -ti $@
}

docker_stop_all() {
  sudo docker ps --format '{{.Names}}' | xargs -P4 -I$$ sudo docker stop $$
}
