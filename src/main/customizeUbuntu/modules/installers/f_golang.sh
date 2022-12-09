## Golang functions
function f_golang_repo () {
    VERSION="1.19.3" 
    ARCH="amd64" 
    curl -O -L "https://golang.org/dl/go${VERSION}.linux-${ARCH}.tar.gz"
}

function f_golang_install () {
    tar -xf "go${VERSION}.linux-${ARCH}.tar.gz"
    sudo mv -v go /usr/local
}

function f_golang_configure () {
    echo "Configure golang"
	echo "path+=/usr/local/go/bin" >> ~/.zshrc
}

function f_golang_checker () {
    export PATH=$PATH:/usr/local/go/bin
    echo "+---------+"
    echo "Version is:"
    go version
    echo "-----------"
}