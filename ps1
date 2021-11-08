#!/usr/bin/env bash

export GIT_PS1_SHOWDIRTYSTATE=true

if command -v kubectl >/dev/null 2>&1; then
  __kube_ps1() {
    # preserve exit status
    local exit="${?}"

    local K8S_CONTEXT
    K8S_CONTEXT="$(kubectl config view --minify --output=jsonpath --template='{..current-context}/{..namespace}' 2>/dev/null)"

    if [[ -n ${K8S_CONTEXT} ]]; then
      printf "☸️  %s" "${K8S_CONTEXT}"
    fi

    return "${exit}"
  }
fi
export PS1="${Green}\u${NC}@${Blue}\h${NC} \w${Cyan}$(__git_ps1)${NC} ${Cyan}$(__kube_ps1)${NC} \n$ "
