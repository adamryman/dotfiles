
echo "installing dependencies"
sudo apt-get install libusb-dev
echo "downloading, building, and installing teensy"
mkdir -p $HOME/bin
mkdir -p $HOME/external
(
	cd $HOME/external
	git clone https://github.com/PaulStoffregen/teensy_loader_cli
	cd teensy_loader_cli
	make
	ln -s $HOME/external/teensy_loader_cli/teensy_loader_cli $HOME/bin/teensy
)

echo "adding udev rules"
sudo curl https://www.pjrc.com/teensy/49-teensy.rules > /etc/udev/rules.d/49-teensy.rules

