# curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.4/install.sh | bash

install_script = "#{Chef::Config[:file_cache_path]}/nvm-install.sh"

remote_file install_script do
  source "https://raw.githubusercontent.com/creationix/nvm/v0.31.4/install.sh"
  mode '0755'
end

execute "install" do
  command "sh -c #{install_script}"
  user node.default['user']['name']
end