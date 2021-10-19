#!/usr/bin/env bash

TERRAFORM_VERSION="0.15.1"
DELTA_VERSION="0.8.3"
KUBECTL_VERSION="1.20.4"
KUBECTX_VERSION="0.9.4"
KUBENS_VERSION="0.9.4"
KAIL_VERSION="0.15.0"
FZF_VERSION="0.27.3"
KUBESEAL_VERSION="0.15.0"
VEGETA_VERSION="12.8.4"
GOLANGCI_LINT_VERSION="1.40.1"
FLUX2_VERSION="0.15.3"

function upgrade_all_linux_amd64() {
  upgrade_terraform "${TERRAFORM_VERSION}" "linux_amd64"
  upgrade_delta "${DELTA_VERSION}" "x86_64-unknown-linux-gnu"
  upgrade_kubectl "${KUBECTL_VERSION}" "linux/amd64"
  upgrade_kubectx "${KUBECTX_VERSION}" "linux_x86_64"
  upgrade_kubens "${KUBENS_VERSION}" "linux_x86_64"
  upgrade_kail "${KAIL_VERSION}" "linux_amd64"
  upgrade_fzf "${FZF_VERSION}" "linux_amd64" "tar.gz"
  upgrade_kubeseal "${KUBESEAL_VERSION}" "linux-amd64"
  upgrade_mc "linux-amd64"
  upgrade_vegeta "${VEGETA_VERSION}" "linux_x86_64"
  upgrade_golangci-lint "${GOLANGCI_LINT_VERSION}" "linux-amd64"
  upgrade_flux2 "${FLUX2_VERSION}" "linux_amd64"
}

function upgrade_all_darwin_amd64() {
  upgrade_terraform "${TERRAFORM_VERSION}" "darwin_amd64"
  upgrade_delta "${DELTA_VERSION}" "x86_64-apple-darwin"
  upgrade_kubectl "${KUBECTL_VERSION}" "darwin/amd64"
  upgrade_kubectx "${KUBECTX_VERSION}" "darwin_x86_64"
  upgrade_kubens "${KUBENS_VERSION}" "darwin_x86_64"
  upgrade_kail "${KAIL_VERSION}" "darwin_amd64"
  upgrade_fzf "${FZF_VERSION}" "darwin_amd64" "zip"
  upgrade_kubeseal "${KUBESEAL_VERSION}" "darwin-amd64"
  upgrade_mc "darwin-amd64"
  upgrade_vegeta "${VEGETA_VERSION}" "darwin_amd64"
  upgrade_golangci-lint "${GOLANGCI_LINT_VERSION}" "darwin-amd64"
  upgrade_flux2 "${FLUX2_VERSION}" "darwin_amd64"
}


BIN_DIR="$HOME/bin"

function upgrade_terraform() {
	local VERSION="${1}"
	local ARCH="${2}"
	if [[ -z ${VERSION} ]]; then
		echo "Please, specify a version (example: 0.13.4)"
	else
		local URL="https://releases.hashicorp.com/terraform/${VERSION}/terraform_${VERSION}_${ARCH}.zip"
    echo ${URL}
		local FILENAME="$(basename ${URL})"
		curl -o "/tmp/${FILENAME}" "${URL}"
		unzip "/tmp/${FILENAME}" -d "${BIN_DIR}"
	fi
}

function upgrade_delta() {
	local VERSION="${1}"
	local ARCH="${2}"
	if [[ -z ${VERSION} ]]; then
		echo "Please, specify a version (example: 0.4.4)"
	else
		local URL="https://github.com/dandavison/delta/releases/download/${VERSION}/delta-${VERSION}-${ARCH}.tar.gz"
    echo ${URL}
		local FILENAME="$(basename ${URL})"
		curl -L -o "/tmp/${FILENAME}" "${URL}"
		tar -xvzf "/tmp/${FILENAME}" -C "/tmp" "delta-${VERSION}-${ARCH}/delta"
		mv "/tmp/delta-${VERSION}-${ARCH}/delta" "${BIN_DIR}"

	fi
}

function upgrade_kubectl() {
  local VERSION="${1}"
	local ARCH="${2}"
  if [[ -z ${VERSION} ]]; then
    echo "Please, specify a version (example: 1.19.0)"
  else
    local FILENAME="kubectl"
    local URL="https://storage.googleapis.com/kubernetes-release/release/v${VERSION}/bin/${ARCH}/${FILENAME}"
    echo ${URL}
    curl -L -o "${BIN_DIR}/${FILENAME}" "${URL}"
    chmod +x "${BIN_DIR}/${FILENAME}"
  fi
}

function upgrade_kubectx() {
  local VERSION="${1}"
	local ARCH="${2}"
  if [[ -z ${VERSION} ]]; then
    echo "Please, specify a version (example: 0.9.1)"
  else
    local FILENAME="kubectx"
    local URL="https://github.com/ahmetb/kubectx/releases/download/v${VERSION}/${FILENAME}_v${VERSION}_${ARCH}.tar.gz"
    echo ${URL}
    curl -L -o "/tmp/${FILENAME}.tar.gz" "${URL}"
    tar -xvzf "/tmp/${FILENAME}.tar.gz" -C "/tmp" "${FILENAME}"
    mv "/tmp/${FILENAME}" "${BIN_DIR}/${FILENAME}"
    chmod +x "${BIN_DIR}/${FILENAME}"
  fi
}

function upgrade_kubens() {
  local VERSION="${1}"
	local ARCH="${2}"
  if [[ -z ${VERSION} ]]; then
    echo "Please, specify a version (example: 0.9.1)"
  else
    local FILENAME="kubens"
    local URL="https://github.com/ahmetb/kubectx/releases/download/v${VERSION}/${FILENAME}_v${VERSION}_${ARCH}.tar.gz"
    echo ${URL}
    curl -L -o "/tmp/${FILENAME}.tar.gz" "${URL}"
    tar -xvzf "/tmp/${FILENAME}.tar.gz" -C "/tmp" "${FILENAME}"
    mv "/tmp/${FILENAME}" "${BIN_DIR}/${FILENAME}"
    chmod +x "${BIN_DIR}/${FILENAME}"
  fi
}

function upgrade_kail() {
  local VERSION="${1}"
	local ARCH="${2}"
  if [[ -z ${VERSION} ]]; then
    echo "Please, specify a version (example: 0.15.0)"
  else
    local FILENAME="kail"
    local URL="https://github.com/boz/kail/releases/download/v${VERSION}/${FILENAME}_${VERSION}_${ARCH}.tar.gz"
    echo ${URL}
    curl -L -o "/tmp/${FILENAME}.tar.gz" "${URL}"
    tar -xvzf "/tmp/${FILENAME}.tar.gz" -C "/tmp" "${FILENAME}"
    mv "/tmp/${FILENAME}" "${BIN_DIR}/${FILENAME}"
    chmod +x "${BIN_DIR}/${FILENAME}"
  fi
}

function upgrade_fzf() {
  local VERSION="${1}"
	local ARCH="${2}"
	local EXTENSION="${3}"
  if [[ -z ${VERSION} ]]; then
    echo "Please, specify a version (example: 0.24.2)"
  else
    local FILENAME="fzf"
    local URL="https://github.com/junegunn/${FILENAME}/releases/download/${VERSION}/${FILENAME}-${VERSION}-${ARCH}.${EXTENSION}"
    echo ${URL}
    curl -L -f -o "/tmp/${FILENAME}" "${URL}"
    case "${EXTENSION}" in
      "zip")
        unzip "/tmp/${FILENAME}"
        ;;
        *)
          tar -xvzf "/tmp/${FILENAME}" -C "/tmp" "${FILENAME}"
          ;;
      esac
    mv "/tmp/${FILENAME}" "${BIN_DIR}/${FILENAME}"
    chmod +x "${BIN_DIR}/${FILENAME}"
  fi
}

function upgrade_kubeseal() {
  local VERSION="${1}"
	local ARCH="${2}"
  if [[ -z ${VERSION} ]]; then
    echo "Please, specify a version (example: 0.13.1)"
  else
    local FILENAME="kubeseal"
    local URL="https://github.com/bitnami-labs/sealed-secrets/releases/download/v${VERSION}/${FILENAME}-${ARCH}"
    echo ${URL}
    curl -L -o "/tmp/${FILENAME}" "${URL}"
    mv "/tmp/${FILENAME}" "${BIN_DIR}/${FILENAME}"
    chmod +x "${BIN_DIR}/${FILENAME}"
  fi
}

function upgrade_mc() {
	local ARCH="${1}"
  local URL="https://dl.min.io/client/mc/release/${ARCH}/mc"
  echo ${URL}
  local FILENAME="$(basename ${URL})"
  curl -o "${BIN_DIR}/${FILENAME}" "${URL}"
  chmod +x "${BIN_DIR}/${FILENAME}"
}

function upgrade_vegeta() {
	local VERSION="${1}"
	local ARCH="${2}"
	if [[ -z ${VERSION} ]]; then
		echo "Please, specify a version (example: 12.8.4)"
	else
		local URL="https://github.com/tsenart/vegeta/releases/download/v${VERSION}/vegeta_${VERSION}_${ARCH}.tar.gz"
    echo ${URL}
		local FILENAME="$(basename ${URL})"
		curl -L -o "/tmp/${FILENAME}" "${URL}"
		tar -xvzf "/tmp/${FILENAME}" -C "${BIN_DIR}" "vegeta"
	fi
}

function upgrade_golangci-lint() {
	local VERSION="${1}"
	local ARCH="${2}"
	if [[ -z ${VERSION} ]]; then
		echo "Please, specify a version (example: 1.40.1)"
	else
		local URL="https://github.com/golangci/golangci-lint/releases/download/v${VERSION}/golangci-lint-${VERSION}-${ARCH}.tar.gz"
    echo ${URL}
		local FILENAME="$(basename ${URL})"
		curl -L -o "/tmp/${FILENAME}" "${URL}"
		tar -xvzf "/tmp/${FILENAME}" -C "/tmp"
    mv  "/tmp/golangci-lint-1.40.1-${ARCH}/golangci-lint" ${BIN_DIR}
	fi
}

function upgrade_flux2() {
	local VERSION="${1}"
	local ARCH="${2}"
	if [[ -z ${VERSION} ]]; then
		echo "Please, specify a version (example: 12.8.4)"
	else
    local URL="https://github.com/fluxcd/flux2/releases/download/v${VERSION}/flux_${VERSION}_${ARCH}.tar.gz"
    echo ${URL}
    local FILENAME="$(basename ${URL})"
    curl -L -o "/tmp/${FILENAME}" "${URL}"
		tar -xvzf "/tmp/${FILENAME}" -C "${BIN_DIR}" "flux"
	fi
}


