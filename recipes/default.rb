
# Essentially, this is a single user system setup. We'll need asdf-managed
# stuff a lot so just add it to the path.
home = node.default['user']['homedir']
ENV['PATH'] = "#{ENV['PATH']}:" + "#{home}/.asdf/bin:#{home}/.asdf/shims"

package 'nano' do
  action :remove
end

include_recipe 'devbox::git'
include_recipe 'devbox::asdf'
include_recipe 'devbox::emacs'
include_recipe 'devbox::vim'
include_recipe 'devbox::terminator'
include_recipe 'devbox::nerves'

# Todo:
# - Add private key that can talk to github for at least checkout. The idea is
# to add a dummy user and add that as collaborator r/o on private repos, than
# have that ssh key in this repo. Not ideal, but doable. Alternatively, research
# Chef encrypted databags.
# - Setup profile/bash, dotfiles repo
# - Integrate ~/.spacemacs.d with dotfiles repo
# - Install syncthing(?).
