## Oh My Zsh + Antigen
function f_oh_my_zsh_install () {
	##TODO:// Fix indentation for better readibility, EOF doesn´t play well here // TABS vs Spaces...
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
	## Antigen 
	curl -L git.io/antigen > ~/antigen.zsh
}

function f_oh_my_zsh_configure () {
	echo "Configure Oh my zhs"
	##TODO:// Fix indentation for better readibility, EOF doesn´t play well here // TABS vs Spaces...
	echo 'source ~/antigen.zsh' >> ~/.zshrc
	echo 'antigen init ~/.antigenrc' >> ~/.zshrc
	cat <<-EOF > ~/.antigenrc
	# Load oh-my-zsh library
	antigen use oh-my-zsh
	# Load bundles from the default repo (oh-my-zsh)
	antigen bundle git
	antigen bundle command-not-found
	antigen bundle docker
	antigen bundle kubectl
	antigen bundle helm
	antigen bundle aws
	# Load bundles from external repos
	antigen bundle zsh-users/zsh-completions
	antigen bundle zsh-users/zsh-autosuggestions
	antigen bundle zsh-users/zsh-syntax-highlighting
	# Select theme
	antigen theme romkatv/powerlevel10k
	# Tell Antigen that you're done
	antigen apply
	EOF
	echo '# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.' >> ~/.zshrc
	echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> ~/.zshrc
	sudo cp devEnv/.p10k.zsh ~/.p10k.zsh
	sudo chown $WSL_USER:$WSL_USER ~/.p10k.zsh
	sudo chmod 644 ~/.p10k.zsh
}