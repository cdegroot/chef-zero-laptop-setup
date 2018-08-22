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

execute 'asdf install' do
  cwd '/home/cees'
  user 'cees'
end

execute '~/.asdf/plugins/nodejs/bin/import-release-team-keyring' do
  user 'cees'
end
execute 'mix local.hex --force'  do
  user 'cees'
end
execute 'mix local.rebar --force' do
  user 'cees'
end
