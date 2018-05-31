# Install ASDF and a bunch of default global versions

asdf_user_install node.default['user']['account'] do
  action :install
end
%w(elixir erlang nodejs ruby).map { |plugin|
  asdf_plugin plugin do
    user node.default['user']['account']
  end
}
