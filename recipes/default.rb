
node.default['homebrew']['owner'] = node.default['user']['name']
include_recipe 'homebrew'

include_recipe 'devbox::iterm'
include_recipe 'devbox::oh-my-zsh'
include_recipe 'devbox::nvm'
include_recipe 'devbox::rvm'