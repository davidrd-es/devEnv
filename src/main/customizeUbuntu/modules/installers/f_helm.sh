# Helm
function f_helm_install () {
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
    chmod 700 get_helm.sh
    ./get_helm.sh
}

function f_helm_configure () {
    echo "Configure Helm"
}

function f_helm_checker () {
    echo "+---------+"
    echo "Version is:"
    /usr/local/bin/helm version
    echo "-----------"
}
