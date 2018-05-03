
# Essentially, this is a single user system setup. We'll need asdf-managed
# stuff a lot so just add it to the path.
home = node.default['user']['homedir']
ENV['PATH'] = "#{ENV['PATH']}:" + "#{home}/.asdf/bin:#{home}/.asdf/shims"

include_recipe 'devbox::git'
include_recipe 'devbox::asdf'
include_recipe 'devbox::emacs'
include_recipe 'devbox::vim'
include_recipe 'devbox::terminator'
include_recipe 'devbox::nerves'

# Todo:
# Setup profile/bash
