# \curl -sSL https://get.rvm.io | bash -s stable

install_script = "#{Chef::Config[:file_cache_path]}/rvm-install.sh"

remote_file install_script do
  source "https://get.rvm.io"
  mode '0755'
end

package 'gpg2'

execute "install" do
  command "gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && #{install_script} stable --auto-dotfiles"
  user node.default['user']['name']
end