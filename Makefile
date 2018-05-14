
all: run

clean:
	rm -rf cookbooks

setup: clean
	/usr/bin/berks vendor cookbooks

run:
	sudo /usr/bin/chef-client -z -r 'role[devbox]'
