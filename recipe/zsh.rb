package 'zsh' do
  action :install
end

git 'clone .dotfiles' do
  # user node[:user][:name]
  destination '.dotfiles'
  repository 'https://github.com/nechinechi/dotfiles.git'
  not_if 'test -d .dotfiles'
end

execute "sudo chown -hR #{node[:user][:name]}:#{node[:user][:group]} .dotfiles" do
  only_if 'test -d .dotfiles'
end

link '.zshrc' do
  # user node[:user][:name]
  to '.dotfiles/.zshrc'
  only_if 'test -d .dotfiles'
  not_if 'test -L .zshrc'
end

execute "sudo chown -h #{node[:user][:name]}:#{node[:user][:group]} .zshrc" do
  # user node[:user][:name]
  only_if 'test -L .zshrc'
end

user 'change shell to zsh' do
  # username の指定がなければ、user resource の後の文字列が入る
  username node[:user][:name]
  password node[:user][:passwd]
  shell '/usr/bin/zsh'
  not_if 'echo $SHELL | grep zsh'
end

# directory 'create zprofile.d' do
#   path '#{node[:zsh][:common_dir]}/zprofile.d'
# end

# execute %(echo 'source #{node[:zsh][:common_dir]}/zprofile.d/rbenv.sh' >> zshenv) do
#   cwd "#{node[:zsh][:common_dir]}"
#   not_if %(grep 'source #{node[:zsh][:common_dir]}/zprofile.d/rbenv.sh' zshenv)
# end

# file '/etc/zsh/zprofile' do
#   action :edit
#   
# end

[
  "if [ -d /etc/profile.d ]; then",
  "  for i in /etc/profile.d/*.sh; do",
  "    if [ -r $i ]; then",
  "       . $i",
  "    fi",
  "  done",
  "  unset i",
  "fi",
  "# read profile.d of bash"
].each do |line|
  execute "echo '#{line}' >> zprofile" do
    cwd "#{node[:zsh][:common_dir]}"
    not_if 'grep "# read profile.d of bash" zprofile'
  end
end
