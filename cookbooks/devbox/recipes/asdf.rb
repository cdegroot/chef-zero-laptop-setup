# Install ASDF and a bunch of default global versions

asdf_user_install node.default['user']['account'] do
  action :install
end
%w(elixir erlang nodejs ruby).map { |plugin|
  asdf_plugin plugin do
    user node.default['user']['account']
  end
}

asdf_plugin 'rebar3' do
  user node.default['user']['account']
  git_url 'https://github.com/Stratus3D/asdf-rebar'
end
