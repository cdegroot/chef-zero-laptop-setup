
apt_package %w(build-essential automake autoconf git squashfs-tools ssh-askpass libssl-dev libncurses5-dev bc m4 unzip cmake python) do
  action :upgrade
end

execute "mix archive.install hex nerves_bootstrap 1.0.0 --force" do
  user node.default['user']['account']
  cwd  node.default['user']['homedir']
  environment ({
    'HOME' => node.default['user']['homedir']
  })
  creates "#{node.default['user']['homedir']}/.asdf/installs/elixir/1.6.4/.mix/archives/nerves_bootstrap-1.0.0"
end
