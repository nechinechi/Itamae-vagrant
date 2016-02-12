git 'clone rbenv' do
  destination '.rbenv'
  repository 'git://github.com/sstephenson/rbenv.git'
  not_if 'test -e .rbenv'
end

execute 'set environment' do
  command %q(echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc)
  command %q(echo 'eval "$(rbenv init -)"' >> ~/.zshrc)
end

# git '/home/vagrant/.rbenv/plugins/ruby-build' do
#   repository 'git://github.com/sstenphenson/ruby-build.git'
#   not_if 'test -e /home/vagrant/.rbenv/plugins/ruby-build'
# end
