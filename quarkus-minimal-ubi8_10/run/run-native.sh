#!/bin/sh

# Fail on a single failed command
set -eo pipefail

source "$DINHPHU28_CONTAINER_RUN_MODULE/logging.sh"

get_java_options() {
  local proxy_opts
  local opts
  local default_opts="-Dquarkus.http.host=0.0.0.0"

  if [ -f "${DINHPHU28_CONTAINER_RUN_MODULE}/proxy-options" ]; then
    source "${DINHPHU28_CONTAINER_RUN_MODULE}/proxy-options"
    proxy_opts="$(proxy_options)"
  fi

  opts="${default_opts} ${proxy_opts}"
  echo "${opts}" | awk '$1=$1'
}

# Start native
startup() {
  local args

  local procname="${NATIVE_APP_NAME-java}"

  log_info "exec -a \"${procname}\" ${NATIVE_APP} $(get_java_options) $*"
  log_info "running in $PWD"
  exec -a "${procname}" ${NATIVE_APP} $(get_java_options) $*
}

# =============================================================================
# Fire up
startup $*
