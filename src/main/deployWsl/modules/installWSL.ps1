$WSL_USER='drd'
$WSL_USER_PASSWORD='nutanix'

wsl --set-default-version 2

winget install --name 'Ubuntu 22.04.1 LTS' --accept-source-agreements --accept-package-agreements --silent
ubuntu2204.exe install --root 
ubuntu2204.exe run --cd ~ "adduser --disabled-password --gecos '' $WSL_USER" 
ubuntu2204.exe run --cd ~ "echo -n 'drd ALL=(ALL:ALL) NOPASSWD:ALL' | sudo tee /etc/sudoers.d/$WSL_USER > /dev/null" 
$cmd = 'usermod --password $(echo ' + $WSL_USER_PASSWORD + '| openssl passwd -1 -stdin) root'
ubuntu2204.exe run --cd ~ $cmd
ubuntu2204.exe config --default-user $WSL_USER
ubuntu2204.exe run --cd ~ 'git clone https://github.com/davidrd-es/devEnv'
ubuntu2204.exe run --cd ~ 'chmod +x devEnv/run.sh'
ubuntu2204.exe run --cd ~ 'devEnv/run.sh'
$cmd1 = 'echo ' + $WSL_USER_PASSWORD + ' | chsh -s $(which zsh)'
ubuntu2204.exe run --cd ~ $cmd1
wsl --set-default Ubuntu-22.04



