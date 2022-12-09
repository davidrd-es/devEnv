## Powershell functions
function f_powershell_repo () {
    curl "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb" -o packages-microsoft-prod.deb
    sudo dpkg -i packages-microsoft-prod.deb
    #rm -f packages-microsoft-prod.deb
}

function f_powershell_pkg_list () {
	local PKG_LIST=(
		"powershell"
		"gss-ntlmssp"
	)
	echo "${PKG_LIST[@]}"
}

function f_powershell_configure () {
    echo "Configure Powershell"
    sudo pwsh -Command 'Install-Module -Name PSWSMan -Force:$true'
    sudo pwsh -Command 'Install-WSMan'
}

function f_powershell_checker () {
    echo "+---------+"
    echo "Version is:"
    pwsh -v
    echo "-----------"
}