## Rust functions
function f_rust_install () {
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
}

function f_rust_configure () {
    echo "Configure Rust"
}

function f_rust_checker () {
    source "$HOME/.cargo/env"
    echo "+---------+"
    echo "Version is:"
    cargo version
    rustc --version
    echo "-----------"
}