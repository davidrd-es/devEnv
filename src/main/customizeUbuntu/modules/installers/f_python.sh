## Python functions
function f_python_repo () {
	echo "hola"
}

function f_python_pkg_list () {
	local PKG_LIST=(
        "python3"
        "python3-pip"
	)
	echo "${PKG_LIST[@]}"
}

function f_python_configure () {
    echo "Configure Python"
    python3 -m pip install --user --upgrade pip
    python3 -m pip install --user virtualenv
    mkdir ~/venv
}

function f_python_checker () {
    echo "+---------+"
    echo "Version is:"
    python3 -V
	pip3 -V
    echo "-----------"
}