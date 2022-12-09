# etcd_client
function f_etcd_client_pkg_list () {
	local PKG_LIST=(
    	"etcd-client"
	)
	echo "${PKG_LIST[@]}"
}

function f_etcd_client_configure () {
    echo "configure etcd client"
}

function f_etcd_client_checker () {
    echo "+---------+"
    echo "Version is:"
    echo "etcd client is here"
    echo "-----------"
}