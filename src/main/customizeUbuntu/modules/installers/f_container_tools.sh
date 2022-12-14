function f_container_tools_repo () {
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.opensuse.org/repositories/devel:kubic:libcontainers:unstable/xUbuntu_$(lsb_release -rs)/Release.key \
      | gpg --dearmor \
      | sudo tee /etc/apt/keyrings/devel_kubic_libcontainers_unstable.gpg > /dev/null
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/devel_kubic_libcontainers_unstable.gpg]\
        https://download.opensuse.org/repositories/devel:kubic:libcontainers:unstable/xUbuntu_$(lsb_release -rs)/ /" \
      | sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:unstable.list > /dev/null
}

function f_container_pkg_list () {
	local PKG_LIST=(
        "podman"
        "buildah"
        "skopeo"
	)
  echo "${PKG_LIST[@]}"
}

function f_container_configure () {
    echo "Configure container tools: podman, buildah, skopeo"
}

function f_container_tools_checker () {
    echo "+---------+"
    echo "Version is:"
    podman -v
    buildah -v
    skopeo -v
    echo "-----------"
}