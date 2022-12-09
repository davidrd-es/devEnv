# Kustomize
function f_kustomize_install () {
    curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash
    sudo chmod +x kustomize
    sudo mv kustomize /usr/local/bin
}

function f_kustomize_configure () {
    echo "Configure Kustomize"
}

function f_kustomize_checker () {
    echo "+---------+"
    echo "Version is:"
    /usr/local/bin/kustomize version
    echo "-----------"
}