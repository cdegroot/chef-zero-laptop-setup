# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

install_script = "#{Chef::Config[:file_cache_path]}/oh-my-zsh.sh"
default_theme = 'ZSH_THEME="robbyrussell"'
desired_theme = 'ZSH_THEME="agnoster"'
zshrc_file = "#{node.default['user']['homefolder']}/.zshrc"
set_profile_command = 'echo -e "\033]50;SetProfile=Meslo\a"'

remote_file install_script do
  source "https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh"
  mode '0755'
end

execute "install" do
  command "sh -c #{install_script}"
  user node.default['user']['name']
end

ruby_block "set theme" do
  block do
    fe = Chef::Util::FileEdit.new(zshrc_file)
    fe.search_file_replace_line(default_theme, desired_theme)
    fe.write_file
  end
end

ruby_block "set profile if not exists" do
  block do
    File.open(zshrc_file, 'a') do |f|
	  f.puts set_profile_command
	end
  end
  only_if { !File.open(zshrc_file) { |f| f.each_line.detect { |line| /echo -e "\\033\]50;SetProfile=Meslo\\a/.match(line) } } }
end