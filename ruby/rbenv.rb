git '/home/vagrant/.rbenv' do
  repository 'git://github.com/sstephenson/rbenv.git'
  not_if 'test -e /home/vagrant/.rbenv'
end

execute 'set environment' do
  command %q(echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> )
end

# git '/home/vagrant/.rbenv/plugins/ruby-build' do
#   repository 'git://github.com/sstenphenson/ruby-build.git'
#   not_if 'test -e /home/vagrant/.rbenv/plugins/ruby-build'
# end
