# instructions from https://www.microsoft.com/net/core#macos
# brew update
# brew install openssl
# ln -s /usr/local/opt/openssl/lib/libcrypto.1.0.0.dylib /usr/local/lib/
# ln -s /usr/local/opt/openssl/lib/libssl.1.0.0.dylib /usr/local/lib/

package 'openssl' do
end

link '/usr/local/lib/libcrypto.1.0.0.dylib' do
  to '/usr/local/opt/openssl/lib/libcrypto.1.0.0.dylib'
  link_type :symbolic
  action :nothing
  subscribes :create, 'package[openssl]', :immediately
end

link '/usr/local/lib/libssl.1.0.0.dylib' do
  to '/usr/local/opt/openssl/lib/libssl.1.0.0.dylib'
  link_type :symbolic
  action :nothing
  subscribes :create, 'package[openssl]', :immediately
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