# Minio cli
function f_minio_repo () {
    curl https://dl.min.io/client/mc/release/linux-amd64/mc -o ./mc  
}

function f_minio_install () {
    sudo chmod +x mc
    sudo mv ./mc /usr/bin/
}

function f_minio_configure () {
    echo "Configure Minio CLI"
}

function f_minio_checker () {
    echo "+---------+"
    echo "Version is:"
    /usr/bin/mc -v
    echo "-----------"
}
