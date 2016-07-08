# %w(libffi-dev libreadline6-dev libssl-dev make zlib1g-dev).each do |pkg|
#   package pkg
# end
# 
# execute "su - -c '#{node[:rbenv][:path]}/bin/rbenv install #{node[:ruby][:version]}'" do
#   # user "#{node[:user][:name]}"
#   not_if "su - -c '#{node[:rbenv][:path]}/bin/rbenv versions' | grep #{node[:ruby][:version]}"
# 
# end
# execute "su - -c 'rbenv global #{node[:ruby][:version]}'" do
#   not_if "su - -c 'rbenv global' | grep #{node[:ruby][:version]}"
# end

# execute 'install ruby' do
#   command "#{node[:rbenv][:path]}/bin/rbenv install #{node[:ruby][:version]}"
#   user 'root'
#   not_if "#{node[:rbenv][:path]}/bin/rbenv versions | grep #{node[:ruby][:version]}"
# end

# execute "set rbenv global" do
#   command "#{node[:rbenv][:path]}/bin/rbenv global #{node[:ruby][:version]}"
#   user 'root'
#   not_if "#{node[:rbenv][:path]}/bin/rbenv global | grep #{node[:ruby][:version]}"
# end


node.validate! do
  {
    ruby: {
      version: string
    }
  }
end

%w(libffi-dev libreadline6-dev libssl-dev make zlib1g-dev).each do |pkg|
  package pkg
end

minor = node['ruby']['version'].match(/^([0-9]+\.[0-9]+)\.[0-9]+$/)[1]
http_request 'ruby' do
  path "/usr/local/src/ruby-#{node['ruby']['version']}.tar.gz"
  url "https://cache.ruby-lang.org/pub/ruby/#{minor}/ruby-#{node['ruby']['version']}.tar.gz"
  not_if "test -e /usr/local/src/ruby-#{node['ruby']['version']}.tar.gz"
end

execute "tar xf ruby-#{node['ruby']['version']}.tar.gz" do
  cwd '/usr/local/src'
  only_if "test -e /usr/local/src/ruby-#{node['ruby']['version']}.tar.gz"
  not_if "test -e /usr/local/src/ruby-#{node['ruby']['version']}"
end

execute './configure && make && make install' do
  cwd "/usr/local/src/ruby-#{node['ruby']['version']}"
  not_if "ruby -v | grep ^.*#{node['ruby']['version']}.*$"
end
