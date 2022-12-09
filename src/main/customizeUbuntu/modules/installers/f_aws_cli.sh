## AWS cli
function f_aws_cli_repo () {
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" >> script.log 2>&1
}

function f_aws_cli_install () {
    unzip awscliv2.zip >> script.log 2>&1
    sudo ./aws/install >> script.log 2>&1
}

function f_aws_cli_configure () {
    echo "Configure AWS cli"
}

function f_aws_cli_checker () {
    echo "+---------+"
    echo "Version is:"
    /usr/local/bin/aws --version
    echo "-----------"
}