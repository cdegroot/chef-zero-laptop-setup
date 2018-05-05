
package 'emacs25' do
  action :upgrade
end

git "#{node.default['user']['homedir']}/.emacs.d" do
  user node.default['user']['account']
  repository "https://github.com/syl20bnr/spacemacs"
end

# TODO checkout ~/.emacs.d
