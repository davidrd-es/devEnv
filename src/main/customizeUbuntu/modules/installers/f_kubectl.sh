# Kubectl
function f_kubectl_repo () {
    sudo curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
    echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | 
        sudo tee /etc/apt/sources.list.d/kubernetes.list
}

function f_kubectl_pkg_list () {
	local PKG_LIST=(
        "kubectl"
	)
	echo "${PKG_LIST[@]}"
}

function f_kubectl_configure () {
    echo "Configure Kubectl"
}

function f_kubectl_checker () {
    echo "+---------+"
    echo "Version is:"
    kubectl version
    echo "-----------"
}