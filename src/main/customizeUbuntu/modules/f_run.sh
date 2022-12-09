for i in modules/installers/*;
  do source $i
done

# Configure APT Repos
function f_configure_apt_repos () {
    f_powershell_repo
    f_python_repo
    f_azure_cli_repo
    f_hashicorp_cli_repo
    f_kubectl_repo
    f_container_tools_repo
}

# Create packages APT packages list
function f_create_packages_list () {
    echo $(f_system_pkg_list)
    echo $(f_powershell_pkg_list)
    echo $(f_python_pkg_list)
    echo $(f_azure_pkg_list)
    echo $(f_hashicorp_cli_pkg_list)
    echo $(f_kubectl_pkg_list)
    echo $(f_etcd_client_pkg_list)
    echo $(f_container_pkg_list)
}

# Run APT Installer
function f_apt_packages_install () {
    local INSTALL_PKGS=$1
    echo "The following packages are installed:"
    echo "-------------------------------------"
    echo "$INSTALL_PKGS"
    echo "-------------------------------------"
    echo "Start OS packages install"
    sudo apt update -y >> script.log 2>&1
    sudo apt upgrade -y >> script.log 2>&1
    sudo apt install -y $(echo $INSTALL_PKGS) >> script.log 2>&1
    echo "OS packages install finished"
}

# Configure Custom Repos
function f_configure_custom_repos () {
    f_golang_repo
    f_aws_cli_repo
    f_minio_repo
    f_argocd_repo
}

# Run Custom Installers
function f_custom_packages_install () {
    f_golang_install
    f_rust_install
    f_aws_cli_install
    f_minio_install
    f_kustomize_install
    f_helm_install
    f_argocd_install
    f_oh_my_zsh_install
}

#Configure Apps
function f_configure_apps () {
    f_oh_my_zsh_configure
    f_powershell_configure
    f_python_configure
    f_golang_configure
    f_rust_configure
    f_azure_cli_configure
    f_aws_cli_configure
    f_hashicorp_cli_configure
    f_minio_configure
    f_kubectl_configure
    f_kustomize_configure
    f_helm_configure
    f_etcd_client_configure
    f_container_configure
    f_argocd_configure
} 

#Run checkers
function f_run_checkers () {
    f_powershell_checker
    f_python_checker
    f_golang_checker
    f_rust_checker
    f_azure_cli_checker
    f_aws_cli_checker
    f_hashicorp_cli_checker
    f_minio_checker
    f_kubectl_checker
    f_kustomize_checker
    f_helm_checker
    f_etcd_client_checker
    f_container_tools_checker
    f_argocd_checker
}

#Run cleanup
function f_cleanup () {
    echo "Cleaning env"
}