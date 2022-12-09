## Azure cli
function f_azure_cli_repo () {
    curl -sL https://packages.microsoft.com/keys/microsoft.asc |
        gpg --dearmor |
        sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null
    AZ_REPO=$(lsb_release -cs)
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" |
        sudo tee /etc/apt/sources.list.d/azure-cli.list
}

function f_azure_pkg_list () {
	local PKG_LIST=(
    	"azure-cli"
	)
	echo "${PKG_LIST[@]}"
}

function f_azure_cli_configure () {
    echo "Configure Azure CLI"
}

function f_azure_cli_checker () {
    echo "+---------+"
    echo "Version is:"
    az version
    echo "-----------"
}