#!/usr/bin/env bash
#

ntfy ()
{
  local MESSAGE="${1}"
  curl -u "${NTFY_CREDENTIAL}" -d "${MESSAGE}" "${NTFY_URL}/${NTFY_TOPIC}"
}

ntfya ()
{
  local MESSAGE="${1}"
  local ATTACHMENT="${2}"
  local FILENAME="$(basename ${ATTACHMENT})"

  echo curl -u "${NTFY_CREDENTIAL}" -T "${ATTACHMENT}" -H "Filename: ${FILENAME}" -d "${MESSAGE}" "${NTFY_URL}/${NTFY_TOPIC}"
}
