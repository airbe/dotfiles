#!/usr/bin/env bash
#

ntfy ()
{
  local MESSAGE="${1}"
  curl -u "${NTFY_CREDENTIAL}" -d "${MESSAGE}" ${NTFY_URL}/${NTFY_TOPIC}
}
