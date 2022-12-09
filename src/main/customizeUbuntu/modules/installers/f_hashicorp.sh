## Hashicorp cli
function f_hashicorp_cli_repo () {
    curl -fsSL https://apt.releases.hashicorp.com/gpg | 
        gpg --dearmor | 
        sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | 
        sudo tee /etc/apt/sources.list.d/hashicorp.list
}

function f_hashicorp_cli_pkg_list () {
	local PKG_LIST=(
        "terraform"
        "packer"
        "vault"
	)
	echo "${PKG_LIST[@]}"
}

function f_hashicorp_cli_configure () {
    echo "Configure Hashicorp CLI: Vault, Terraform, Packer"
}

function f_hashicorp_cli_checker () {
    echo "+---------+"
    echo "Version is:"
    terraform -version
    packer version
    vault version
    echo "-----------"
}