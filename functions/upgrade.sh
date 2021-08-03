#!/usr/bin/env bash

function upgrade_all() {
  upgrade_terraform "0.15.1"
  upgrade_delta "0.7.1"
  upgrade_kubectl "1.20.4"
  upgrade_kubectx "0.9.3"
  upgrade_kubens "0.9.3"
  upgrade_kail "0.15.0"
  upgrade_fzf "0.27.0"
  upgrade_kubeseal "0.15.0"
  upgrade_vegeta "12.8.4"
  upgrade_golangci-lint "1.40.1"
  upgrade_flux2 "0.15.3"
}


BIN_DIR="$HOME/bin"

function upgrade_terraform() {
	local VERSION="${1}"
	if [[ -z ${VERSION} ]]; then
		echo "Please, specify a version (example: 0.13.4)"
	else
		local URL="https://releases.hashicorp.com/terraform/${VERSION}/terraform_${VERSION}_linux_amd64.zip"
		local FILENAME="$(basename ${URL})"
		curl -o "/tmp/${FILENAME}" "${URL}"
		unzip "/tmp/${FILENAME}" -d "${BIN_DIR}"
	fi
}

function upgrade_delta() {
	local VERSION="${1}"
	if [[ -z ${VERSION} ]]; then
		echo "Please, specify a version (example: 0.4.4)"
	else
		local URL="https://github.com/dandavison/delta/releases/download/${VERSION}/delta-${VERSION}-x86_64-unknown-linux-gnu.tar.gz"
		local FILENAME="$(basename ${URL})"
		curl -L -o "/tmp/${FILENAME}" "${URL}"
		tar -xvzf "/tmp/${FILENAME}" -C "/tmp" "delta-${VERSION}-x86_64-unknown-linux-gnu/delta"
		mv "/tmp/delta-${VERSION}-x86_64-unknown-linux-gnu/delta" "${BIN_DIR}"

	fi
}

function upgrade_kubectl() {
  local VERSION="${1}"
  if [[ -z ${VERSION} ]]; then
    echo "Please, specify a version (example: 1.19.0)"
  else
    local FILENAME="kubectl"
    local URL="https://storage.googleapis.com/kubernetes-release/release/v${VERSION}/bin/linux/amd64/${FILENAME}"
    curl -L -o "${BIN_DIR}/${FILENAME}" "${URL}"
    chmod +x "${BIN_DIR}/${FILENAME}"
  fi
}

function upgrade_kubectx() { local VERSION="${1}"
  if [[ -z ${VERSION} ]]; then
    echo "Please, specify a version (example: 0.9.1)"
  else
    local FILENAME="kubectx"
    local URL="https://github.com/ahmetb/kubectx/releases/download/v${VERSION}/${FILENAME}_v${VERSION}_linux_x86_64.tar.gz"
    curl -L -o "/tmp/${FILENAME}" "${URL}"
    tar -xvzf "/tmp/${FILENAME}" -C "/tmp" "${FILENAME}"
    mv "/tmp/${FILENAME}" "${BIN_DIR}/${FILENAME}"
    chmod +x "${BIN_DIR}/${FILENAME}"
  fi
}

function upgrade_kubens() {
  local VERSION="${1}"
  if [[ -z ${VERSION} ]]; then
    echo "Please, specify a version (example: 0.9.1)"
  else
    local FILENAME="kubens"
    local URL="https://github.com/ahmetb/kubectx/releases/download/v${VERSION}/${FILENAME}_v${VERSION}_linux_x86_64.tar.gz"
    curl -L -o "/tmp/${FILENAME}" "${URL}"
    tar -xvzf "/tmp/${FILENAME}" -C "/tmp" "${FILENAME}"
    mv "/tmp/${FILENAME}" "${BIN_DIR}/${FILENAME}"
    chmod +x "${BIN_DIR}/${FILENAME}"
  fi
}

function upgrade_kail() {
  local VERSION="${1}"
  if [[ -z ${VERSION} ]]; then
    echo "Please, specify a version (example: 0.15.0)"
  else
    local FILENAME="kail"
    local URL="https://github.com/boz/kail/releases/download/v${VERSION}/${FILENAME}_${VERSION}_linux_amd64.tar.gz"
    curl -L -o "/tmp/${FILENAME}" "${URL}"
    tar -xvzf "/tmp/${FILENAME}" -C "/tmp" "${FILENAME}"
    mv "/tmp/${FILENAME}" "${BIN_DIR}/${FILENAME}"
    chmod +x "${BIN_DIR}/${FILENAME}"
  fi
}

function upgrade_fzf() {
  local VERSION="${1}"
  if [[ -z ${VERSION} ]]; then
    echo "Please, specify a version (example: 0.24.2)"
  else
    local FILENAME="fzf"
    local URL="https://github.com/junegunn/${FILENAME}/releases/download/${VERSION}/${FILENAME}-${VERSION}-linux_amd64.tar.gz"
    curl -L -o "/tmp/${FILENAME}" "${URL}"
    tar -xvzf "/tmp/${FILENAME}" -C "/tmp" "${FILENAME}"
    mv "/tmp/${FILENAME}" "${BIN_DIR}/${FILENAME}"
    chmod +x "${BIN_DIR}/${FILENAME}"
  fi
}

function upgrade_kubeseal() {
  local VERSION="${1}"
  if [[ -z ${VERSION} ]]; then
    echo "Please, specify a version (example: 0.13.1)"
  else
    local FILENAME="kubeseal"
    local URL="https://github.com/bitnami-labs/sealed-secrets/releases/download/v${VERSION}/${FILENAME}-linux-amd64"
    curl -L -o "/tmp/${FILENAME}" "${URL}"
    mv "/tmp/${FILENAME}" "${BIN_DIR}/${FILENAME}"
    chmod +x "${BIN_DIR}/${FILENAME}"
  fi
}

function upgrade_mc() {
  local URL="https://dl.min.io/client/mc/release/linux-amd64/mc"
  local FILENAME="$(basename ${URL})"
  curl -o "${BIN_DIR}/${FILENAME}" "${URL}"
  chmod +x "${BIN_DIR}/${FILENAME}"
}

function upgrade_vegeta() {
	local VERSION="${1}"
	if [[ -z ${VERSION} ]]; then
		echo "Please, specify a version (example: 12.8.4)"
	else
		local URL="https://github.com/tsenart/vegeta/releases/download/v${VERSION}/vegeta_${VERSION}_linux_amd64.tar.gz"
		local FILENAME="$(basename ${URL})"
		curl -L -o "/tmp/${FILENAME}" "${URL}"
		tar -xvzf "/tmp/${FILENAME}" -C "${BIN_DIR}" "vegeta"
	fi
}

function upgrade_golangci-lint() {
	local VERSION="${1}"
	if [[ -z ${VERSION} ]]; then
		echo "Please, specify a version (example: 1.40.1)"
	else
		local URL="https://github.com/golangci/golangci-lint/releases/download/v${VERSION}/golangci-lint-${VERSION}-linux-amd64.tar.gz"
		local FILENAME="$(basename ${URL})"
		curl -L -o "/tmp/${FILENAME}" "${URL}"
		tar -xvzf "/tmp/${FILENAME}" -C "/tmp"
    mv  "/tmp/golangci-lint-1.40.1-linux-amd64/golangci-lint" ${BIN_DIR}
	fi
}

function upgrade_flux2() {
	local VERSION="${1}"
	if [[ -z ${VERSION} ]]; then
		echo "Please, specify a version (example: 12.8.4)"
	else
    local URL="https://github.com/fluxcd/flux2/releases/download/v${VERSION}/flux_${VERSION}_linux_amd64.tar.gz"
    local FILENAME="$(basename ${URL})"
    curl -L -o "/tmp/${FILENAME}" "${URL}"
		tar -xvzf "/tmp/${FILENAME}" -C "${BIN_DIR}" "flux"
	fi
}


