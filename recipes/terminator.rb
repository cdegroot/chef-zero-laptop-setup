package 'terminator' do
  action :upgrade
end
cookbook_file "#{node.default['user']['homedir']}/.config/terminator/config" do
  source 'terminator-config'
  owner node.default['user']['account']
end
