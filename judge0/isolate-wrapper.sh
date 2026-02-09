#!/bin/bash
# Wrapper to strip cgroup flags for cgroup v2 compatibility
# Process isolation still works, but memory/CPU cgroup limits are disabled
ARGS=()
for arg in "$@"; do
  case "$arg" in
    --cg|--cg-timing|--cg-mem=*) ;; # skip cgroup flags
    *) ARGS+=("$arg") ;;
  esac
done
exec /usr/local/bin/isolate-real "${ARGS[@]}"
