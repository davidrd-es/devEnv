# Argocd
function f_argocd_repo () {
    sudo curl -sSL -o argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
}

function f_argocd_install () {
    sudo chmod +x argocd
    sudo mv argocd /usr/local/bin/argocd
}

function f_argocd_configure () {
    echo "Configure ArgoCD"
}

function f_argocd_checker () {
    echo "+---------+"
    echo "Version is:"
    /usr/local/bin/argocd version
    echo "-----------"
}