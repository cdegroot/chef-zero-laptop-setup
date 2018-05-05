package 'vim' do
  action :upgrade
end

cookbook_file "#{node.default['user']['homedir']}/.vimrc" do
  source '.vimrc'
  owner node.default['user']['account']
end
