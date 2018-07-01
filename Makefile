
all: run

clean:
	rm -rf cookbooks

setup: clean
	/usr/bin/berks vendor cookbooks

run:
	sudo -E /usr/bin/chef-client -z -r 'role[devbox]'
	sudo chown -R ${USER} .

firstinstall:
	sudo apt update
	sudo apt install git chef chef-zero
