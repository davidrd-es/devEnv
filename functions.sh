# Init

# Vars
WSL_USER=$(whoami)
PKG_LIST=''

# Functions

## Installer
f_packages_install () {
    INSTALL_PKGS=$1
    echo "The following packages are installed:"
    echo "-------------------------------------"
    echo $INSTALL_PKGS
    echo "-------------------------------------"
    echo "Start OS packages install"
    sudo apt update -y >> script.log 2>&1
    sudo apt upgrade -y >> script.log 2>&1
    sudo apt install -y $(echo $INSTALL_PKGS) >> script.log 2>&1
    echo "OS packages install finished"
}

## System Packages
f_system_pkg_list () {
	PKG_LIST=(
        "apt-transport-https"
        "ca-certificates"
        "curl"
        "lsb-release"
        "git"
        "gnupg"
        "curl"
        "wget"
        "openssl"
        "openssh-client"
        "unzip"
        "jq"
        "zsh"
	)
	echo $PKG_LIST
}


## Oh My Zsh + Antigen
f_oh_my_zsh_install () {
	##TODO:// Fix indentation for better readibility, EOF doesn´t play well here // TABS vs Spaces...
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
	## Antigen 
	curl -L git.io/antigen > ~/antigen.zsh
}

f_oh_my_zsh_configure () {
	##TODO:// Fix indentation for better readibility, EOF doesn´t play well here // TABS vs Spaces...
	echo 'source ~/antigen.zsh' >> ~/.zshrc
	echo 'antigen init ~/.antigenrc' >> ~/.zshrc
	cat <<-EOF > ~/.antigenrc
	# Load oh-my-zsh library
	antigen use oh-my-zsh
	# Load bundles from the default repo (oh-my-zsh)
	antigen bundle git
	antigen bundle command-not-found
	antigen bundle docker
	antigen bundle kubectl
	antigen bundle helm
	antigen bundle aws
	# Load bundles from external repos
	antigen bundle zsh-users/zsh-completions
	antigen bundle zsh-users/zsh-autosuggestions
	antigen bundle zsh-users/zsh-syntax-highlighting
	# Select theme
	antigen theme romkatv/powerlevel10k
	# Tell Antigen that you're done
	antigen apply
	EOF
	echo '# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.' >> ~/.zshrc
	echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> ~/.zshrc
	sudo cp devEnv/.p10k.zsh ~/.p10k.zsh
	sudo chown $WSL_USER:$WSL_USER ~/.p10k.zsh
	sudo chmod 644 ~/.p10k.zsh
}


## Powershell functions
f_powershell_repo () {
    wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb"
    sudo dpkg -i packages-microsoft-prod.deb
}

f_powershell_pkg_list () {
	PKG_LIST=(
		"powershell"
		"gss-ntlmssp"
	)
	echo $PKG_LIST
}

f_powershell_configure () {
    sudo pwsh -Command 'Install-Module -Name PSWSMan -Force:$true'
    sudo pwsh -Command 'Install-WSMan'
}

f_powershell_checker () {
    pwsh -v
}


## Python functions
f_python_repo () {
	## Placeholder
}

f_python_pkg_list () {
	PKG_LIST=(
        "python3"
        "python3-pip"
	)
	echo $PKG_LIST
}

f_python_configure () {
    python3 -m pip install --user --upgrade pip
    python3 -m pip install --user virtualenv
    mkdir ~/venv
}

f_python_checker () {
    python3 -V
	pip3 -V
}


## Golang functions
f_golang_repo () {
    VERSION="1.19.3" 
    ARCH="amd64" 
    curl -O -L "https://golang.org/dl/go${VERSION}.linux-${ARCH}.tar.gz"
}

f_golang_install () {
    tar -xf "go${VERSION}.linux-${ARCH}.tar.gz"
    sudo mv -v go /usr/local
}

f_golang_configure () {
	echo "path+=/usr/local/go/bin" >> ~/.zshrc
}

f_golang_checker () {
    export PATH=$PATH:/usr/local/go/bin
    go version
}


## Rust functions
f_rust_install () {
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
}

f_rust_configure () {
    # Placeholder
}

f_rust_checker () {
    source "$HOME/.cargo/env"
    cargo version
    rustc --version
}


## Azure cli
f_azure_cli_repo () {
    curl -sL https://packages.microsoft.com/keys/microsoft.asc |
        gpg --dearmor |
        sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null
    AZ_REPO=$(lsb_release -cs)
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" |
        sudo tee /etc/apt/sources.list.d/azure-cli.list
}

f_azure_pkg_list () {
	PKG_LIST=(
    	"azure-cli"
	)
	echo $PKG_LIST
}

f_azure_cli_configure () {
    #Placeholder
}

f_azure_cli_checker () {
    az version
}


## AWS cli
f_aws_cli_repo () {
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
}

f_aws_cli_install () {
    unzip awscliv2.zip
    sudo ./aws/install
}

f_aws_cli_configure () {
    #Placeholder
}

f_aws_cli_checker () {
    /usr/local/bin/aws --version
}


## Hashicorp cli
f_hashicorp_cli_repo () {
    wget -O- https://apt.releases.hashicorp.com/gpg | 
        gpg --dearmor | 
        sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | 
        sudo tee /etc/apt/sources.list.d/hashicorp.list
}

f_hashicorp_cli_pkg_list () {
	PKG_LIST=(
        "terraform"
        "packer"
        "vault"
	)
	echo $PKG_LIST
}

f_hashicorp_cli_configure () {
    #Placeholder
}

f_hashicorp_cli_checker () {
    terraform -version
    packer version
    vault version
}


# Minio cli
f_minio_repo () {
    curl https://dl.min.io/client/mc/release/linux-amd64/mc -o ./mc  
}

f_minio_install () {
    sudo chmod +x mc
    sudo mv ./mc /usr/bin/
}

f_minio_configure () {
    #Placeholder
}

f_minio_checker () {
    /usr/bin/mc -v
}


# Kubectl
f_kubectl_repo () {
    sudo curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
    echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | 
        sudo tee /etc/apt/sources.list.d/kubernetes.list
}

f_kubectl_pkg_list () {
	PKG_LIST=(
        "kubectl"
	)
	echo $PKG_LIST
}

f_kubectl_configure () {
    #Placeholder
}

f_kubectl_checker () {
    kubectl version
}


# Kustomize
f_kustomize_install () {
    curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash
    sudo chmod +x kustomize
    sudo mv kustomize /usr/local/bin
}

f_kustomize_configure () {
    #Placeholder
}

f_kustomize_checker () {
    /usr/local/bin/kustomize version
}


# Helm
f_helm_install () {
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
    chmod 700 get_helm.sh
    ./get_helm.sh
}

f_helm_configure () {
    # Placeholder
}

f_helm_checker () {
    /usr/local/bin/helm version
}


# etcd_client
f_etcd_client_pkg_list () {
	PKG_LIST=(
    	"etcd-client"
	)
	echo $PKG_LIST
}

f_etcd_client_configure () {

}

f_etcd_client_checker () {
}


f_container_tools_repo () {
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.opensuse.org/repositories/devel:kubic:libcontainers:unstable/xUbuntu_$(lsb_release -rs)/Release.key \
      | gpg --dearmor \
      | sudo tee /etc/apt/keyrings/devel_kubic_libcontainers_unstable.gpg > /dev/null
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/devel_kubic_libcontainers_unstable.gpg]\
        https://download.opensuse.org/repositories/devel:kubic:libcontainers:unstable/xUbuntu_$(lsb_release -rs)/ /" \
      | sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:unstable.list > /dev/null
}

f_container_pkg_list () {
	PKG_LIST=(
        "podman"
        "buildah"
        "skopeo"
	)
	echo $PKG_LIST
}

f_container_configure () {
    # Placeholder
}

f_container_tools_checker () {
    podman -v
    buildah -v
    skopeo -v
}


# Argocd
f_argocd_repo () {
    sudo curl -sSL -o argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
}

f_argocd_install () {
    sudo chmod +x argocd
    sudo mv argocd /usr/local/bin/argocd
}

f_argocd_configure () {
    #
}

f_argocd_checker () {
    /usr/local/bin/argocd version
}

# Configure APT Repos
f_powershell_repo
f_python_repo
f_azure_cli_repo
f_hashicorp_cli_repo
f_kubectl_repo
f_container_tools_repo


# Configure APT packages
PKG_LIST="$PKG_LIST $(f_system_pkg_list)"
PKG_LIST="$PKG_LIST $(f_powershell_pkg_list)"
PKG_LIST="$PKG_LIST $(f_python_pkg_list)"
PKG_LIST="$PKG_LIST $(f_azure_pkg_list)"
PKG_LIST="$PKG_LIST $(f_hashicorp_cli_pkg_list)"
PKG_LIST="$PKG_LIST $(f_kubectl_pkg_list)"
PKG_LIST="$PKG_LIST $(f_etcd_client_pkg_list)"
PKG_LIST="$PKG_LIST $(f_container_pkg_list)"

# Run APT Installer
f_packages_install $PKG_LIST

# Configure Custom Repos
f_golang_repo
f_aws_cli_repo
f_minio_repo
f_argocd_repo

# Run Custom Installers
f_golang_install
f_rust_install
f_aws_cli_install
f_minio_install
f_kustomize_install
f_helm_install
f_argocd_install
f_oh_my_zsh_install

#Configure Apps
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

#Run checkers
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