group 'rbenv' do
  not_if 'getent group rbenv'
end

execute 'usermod -aG rbenv root' do
  not_if 'groups root | grep rbenv'
end

execute "usermod -aG rbenv #{node[:user][:name]}" do
  not_if "groups #{node[:user][:name]} | grep rbenv"
end

git 'clone rbenv' do
  # cwd '/usr/local'
  destination '/usr/local/rbenv'
  repository 'git://github.com/sstephenson/rbenv.git'
  not_if 'test -d /usr/local/rbenv'
end

execute 'mkdir plugins' do
  cwd '/usr/local/rbenv'
  only_if 'test -d /usr/local/rbenv'
  not_if 'test -d /usr/local/rbenv/plugins'
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
  destination '/usr/local/rbenv/plugins/ruby-build'
  repository 'git://github.com/sstephenson/ruby-build.git'
  not_if 'test -d /usr/local/rbenv/plugins/ruby-build'
end

git 'clone rbenv-binstubs' do
  destination '/usr/local/rbenv/plugins/rbenv-binstubs'
  repository 'git://github.com/ianheggie/rbenv-binstubs.git'
  not_if 'test -d /usr/local/rbenv/plugins/rbenv-binstubs'
end

# file 'rbenv.sh' do
#   cwd '/etc/profile.d'
#   user 'root'  # user attribute 追加後 動作未確認
#   content 'export RBENV_ROOT="/usr/local/rbenv"\n'
#   not_if %q(cat rbenv.sh | grep 'export RBENV_ROOT="/usr/local/rbenv"')
# end
execute %q(echo 'export RBENV_ROOT="/usr/local/rbenv"' >> rbenv.sh) do
  cwd '/etc/profile.d'
  not_if %q(grep 'export RBENV_ROOT="/usr/local/rbenv"' rbenv.sh)
end

execute %q(echo 'export PATH="/usr/local/rbenv/bin:$PATH"' >> rbenv.sh) do
  cwd '/etc/profile.d'
  not_if %q(grep 'export PATH="/usr/local/rbenv/bin:$PATH"' rbenv.sh)
end

execute %q(echo 'eval "$(rbenv init -)"' >> rbenv.sh) do
  cwd '/etc/profile.d'
  not_if %q(grep 'eval "$(rbenv init -)"' rbenv.sh)
end

execute 'chgrp rbenv rbenv.sh' do
  cwd '/etc/profile.d'
  only_if 'test -e rbenv.sh'
end

# execute 'sh rbenv.sh' do
#   cwd '/etc/profile.d'
#   # user "#{node[:user][:name]}"
#   not_if 'which rbenv'
# end
execute %q(echo 'source /etc/profile.d/rbenv.sh' >> .zshenv) do
  not_if %q(grep 'source /etc/profile.d/rbenv.sh' .zshenv)
end

execute 'apt-get update'

%w(libffi-dev libreadline6-dev libssl-dev make zlib1g-dev).each do |pkg|
  package pkg
end

execute "su - #{node[:user][:name]} -c '/usr/local/rbenv/libexec/rbenv install #{node[:ruby][:version]}'" do
  # user "#{node[:user][:name]}"
  not_if "rbenv versions | grep #{node[:ruby][:version]}"
end


