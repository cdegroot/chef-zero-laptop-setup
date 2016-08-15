
node.default['homebrew']['owner'] = node.default['user']['name']
include_recipe 'homebrew'

git_user_cmd = "git config --global user.name #{node.default['user']['name']}"
git_email_cmd = "git config --global user.email \"#{node.default['user']['name']}@gmail.com\""
git_autocorrect_cmd = 'git config --global help.autocorrect 5'
git_push_cmd = "git config --global push.default simple"

execute "config git" do
  command "#{git_user_cmd} && #{git_email_cmd} && #{git_autocorrect_cmd} && #{git_push_cmd}"
  user node.default['user']['name']
end

package 'elixir' do; end

include_recipe 'devbox::iterm'
include_recipe 'devbox::oh-my-zsh'
include_recipe 'devbox::nvm'
include_recipe 'devbox::rvm'
include_recipe 'devbox::dotNetCore'