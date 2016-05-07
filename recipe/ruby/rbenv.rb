group 'rbenv' do
  not_if 'getent group rbenv'
end

# res = run_command("cd /usr/local && ls -l | grep rbenv", error: false)
# print res

test = run_command("ls", error: false)
puts test.stdout

# root を rbenv グループに
execute 'usermod -aG rbenv root' do
  not_if 'groups root | grep rbenv'
end

# vagrant を rbenv グループに
execute "usermod -aG rbenv #{node[:user][:name]}" do
  not_if "groups #{node[:user][:name]} | grep rbenv"
end

# Git から rbenv をインストール
git 'clone rbenv' do
  # cwd '/usr/local'
  destination "#{node[:rbenv][:path]}"
  repository 'git://github.com/sstephenson/rbenv.git'
  not_if "test -d #{node[:rbenv][:path]}"
end

directory 'plugins' do
  cwd "#{node[:rbenv][:path]}"
  not_if 'test -d plugins'
end

execute 'chgrp -R rbenv rbenv' do
  cwd '/usr/local'
  only_if 'test -d rbenv'
end

execute 'chmod -R g+rwxXs rbenv' do
  cwd '/usr/local'
  only_if 'test -d rbenv'
end

git 'clone ruby-build' do
  destination "#{node[:rbenv][:path]}/plugins/ruby-build"
  repository 'git://github.com/sstephenson/ruby-build.git'
  not_if "test -d #{node[:rbenv][:path]}/plugins/ruby-build"
end

git 'clone rbenv-binstubs' do
  destination "#{node[:rbenv][:path]}/plugins/rbenv-binstubs"
  repository 'git://github.com/ianheggie/rbenv-binstubs.git'
  not_if "test -d #{node[:rbenv][:path]}/plugins/rbenv-binstubs"
end

# file 'rbenv.sh' do
#   cwd '/etc/profile.d'
#   user 'root'  # user attribute 追加後 動作未確認
#   content 'export RBENV_ROOT="#{node[:rbenv][:path]}"\n'
#   not_if %q(cat rbenv.sh | grep 'export RBENV_ROOT="#{node[:rbenv][:path]}"')
# end
execute %(echo 'export RBENV_ROOT="#{node[:rbenv][:path]}"' >> rbenv.sh) do
  cwd "#{node[:bash][:prof_dir]}"
  not_if %(grep 'export RBENV_ROOT="#{node[:rbenv][:path]}"' rbenv.sh)
end

execute %q(echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> rbenv.sh) do
  cwd "#{node[:bash][:prof_dir]}"
  not_if %q(grep 'export PATH="$RBENV_ROOT/bin:$PATH"' rbenv.sh)
end

execute %q(echo 'eval "$(rbenv init -)"' >> rbenv.sh) do
  cwd "#{node[:bash][:prof_dir]}"
  not_if %q(grep 'eval "$(rbenv init -)"' rbenv.sh)
end

execute 'chgrp rbenv rbenv.sh' do
  cwd "#{node[:bash][:prof_dir]}"
  only_if 'test -e rbenv.sh'
end

