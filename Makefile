
all: run

clean:
	rm -rf cookbooks

setup: clean
	berks vendor cookbooks

run: setup
	sudo chef-client -z -r 'role[devbox]'
