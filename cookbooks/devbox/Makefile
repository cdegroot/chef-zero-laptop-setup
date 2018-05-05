
all: run

clean:
	rm -rf cookbooks

setup: clean
	berks vendor cookbooks

run: 
	sudo chef-client -z -r 'role[devbox]'
