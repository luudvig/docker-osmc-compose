#!/usr/bin/bash

{
  set -e

  if [ -x /usr/bin/docker ]; then
    ENGINE=/usr/bin/docker
  elif [ -x /usr/bin/podman ]; then
    ENGINE=/usr/bin/podman
  else
    exit
  fi

  cd -- "$(dirname -- "${BASH_SOURCE[0]}")"

  "${ENGINE}" compose up --detach --pull always
  "${ENGINE}" system prune --all --force --volumes

} &> "${BASH_SOURCE[0]%.*}.log"
