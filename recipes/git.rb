
package 'git' do
  action :upgrade
end

git_user_cmd = "git config --global user.name \"#{node.default['user']['name']}\""
git_email_cmd = "git config --global user.email \"#{node.default['user']['email']}\""
git_autocorrect_cmd = 'git config --global help.autocorrect 5'
git_push_cmd = "git config --global push.default simple"

execute "config git" do
  command "#{git_user_cmd} && #{git_email_cmd} && #{git_autocorrect_cmd} && #{git_push_cmd}"
  user node.default['user']['account']
  environment ({
    'HOME' => node.default['user']['homedir']
  })
end

