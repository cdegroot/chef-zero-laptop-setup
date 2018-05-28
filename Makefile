
all: run

clean:
	rm -rf cookbooks

setup: clean
	/usr/bin/berks vendor cookbooks

run:
	sudo -E /usr/bin/chef-client -z -r 'role[devbox]'

firstinstall:
	sudo apt update
	sudo apt install git chef chef-zero
