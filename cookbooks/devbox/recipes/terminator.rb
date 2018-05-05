package 'terminator' do
  action :upgrade
end
directory "#{node.default['user']['homedir']}/.config/terminator" do
  mode '0755'
  owner node.default['user']['account']
  recursive true
end
cookbook_file "#{node.default['user']['homedir']}/.config/terminator/config" do
  source 'terminator-config'
  owner node.default['user']['account']
end
