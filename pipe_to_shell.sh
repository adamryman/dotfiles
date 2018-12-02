if ! which git > /dev/null;
	then sudo apt install -y git;
fi && \
	mkdir -p $HOME/dotfiles && \
	git clone https://github.com/adamryman/dotfiles $HOME/dotfiles/. && \
	cd $HOME/dotfiles && \
	./dotfiles.sh
