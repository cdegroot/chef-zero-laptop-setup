
all: run

clean:
	rm -rf cookbooks

setup: clean
	sudo apt-get install -y chefdk
	berks vendor cookbooks

run: setup
	sudo chef-client -z -r 'role[devbox]'
