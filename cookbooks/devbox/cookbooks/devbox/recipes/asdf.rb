# Install ASDF and a bunch of default global versions

asdf_user_install node.default['user']['account'] do
  action :install
end
%w(elixir erlang nodejs ruby).map { |plugin|
  asdf_plugin plugin do
    user node.default['user']['account']
  end
}

cookbook_file "#{node.default['user']['homedir']}/.tool-versions" do
  source '.tool-versions'
  owner node.default['user']['account']
end

execute "asdf install" do
  user node.default['user']['account']
  cwd  node.default['user']['homedir']
end

execute "mix local.hex --if-missing --force" do
  user node.default['user']['account']
  cwd  node.default['user']['homedir']
end

execute "mix local.rebar --if-missing --force" do
  user node.default['user']['account']
  cwd  node.default['user']['homedir']
end


