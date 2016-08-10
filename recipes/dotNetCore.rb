# instructions from https://www.microsoft.com/net/core#macos
# brew update
# brew install openssl
# ln -s /usr/local/opt/openssl/lib/libcrypto.1.0.0.dylib /usr/local/lib/
# ln -s /usr/local/opt/openssl/lib/libssl.1.0.0.dylib /usr/local/lib/

package 'openssl' do
	version '1.0.2h_1'
	notifies :create, 'link[libcrypto]', :immediately
	notifies :create, 'link[libssl]', :immediately
	notifies :create, 'link[openssl]', :immediately
end

link 'openssl' do
  target_file '/usr/local/Cellar/openssl/1.0.2h_1/bin/openssl'
  to '/usr/local/bin/'
  link_type :symbolic
  action :nothing
end

link 'libcrypto' do
  target_file '/usr/local/opt/openssl/lib/libcrypto.1.0.0.dylib'
  to '/usr/local/lib/'
  link_type :symbolic
  action :nothing
end

link 'libssl' do
  target_file '/usr/local/opt/openssl/lib/libssl.1.0.0.dylib'
  to '/usr/local/lib/'
  link_type :symbolic
  action :nothing
end

dotnet_file = "#{Chef::Config[:file_cache_path]}/dotnetcore.pkg"
remote_file dotnet_file do
  source 'https://go.microsoft.com/fwlink/?LinkID=809124'
  mode '0755'
end

execute 'run_installer' do
	subscribes :run, "remote_file[#{dotnet_file}]", :immediately
	command "installer -pkg #{dotnet_file} -target /"
end