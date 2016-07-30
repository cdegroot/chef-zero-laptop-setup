version = "3_0_5"
checksum = "a0081635383a7a1eda12c99c2800979168bfa757b737b0b15a2639bdb2ce6f95"

remote_file "#{Chef::Config[:file_cache_path]}/iTerm2-#{version}.zip" do
  source "http://www.iterm2.com/downloads/stable/iTerm2-#{version}.zip"
  checksum checksum
  notifies :run, 'execute[untar-iterm2]', :immediately
end

execute "untar-iterm2" do
  command "unzip -o #{Chef::Config[:file_cache_path]}/iTerm2-#{version}.zip"
  cwd "/Applications"
  action :nothing
end

execute "git clone fonts" do
	command "git clone https://github.com/powerline/fonts.git"
	only_if { !File.directory? "fonts" }
end

execute "git update fonts" do
	command "cd fonts && git pull"
	only_if { File.directory? "fonts" }
end

execute "install fonts" do
	command "cd fonts && ./install.sh"
end

dynamic_profile = "#{node.default['user']['homefolder']}/Library/Application Support/iTerm2/DynamicProfiles"
directory dynamic_profile

cookbook_file "#{dynamic_profile}/font.plist" do
  source "font.plist"
end