function f_system_pkg_list () {
    local PKG_LIST=(
        "apt-transport-https"
        "ca-certificates"
        "curl"
        "lsb-release"
        "git"
        "gnupg"
        "tree"
        "curl"
        "wget"
        "openssl"
        "openssh-client"
        "unzip"
        "jq"
        "zsh"
    )
    echo "${PKG_LIST[@]}"
}