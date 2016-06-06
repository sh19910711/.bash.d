chromium_tmp() {
  local uuid=$(cat /proc/sys/kernel/random/uuid)
  local dir=/tmp/.chromium/${uuid}
  mkdir -p ${dir}
  chmod go-rwx ${dir}
  chromium --user-data-dir=${dir} $@
}
