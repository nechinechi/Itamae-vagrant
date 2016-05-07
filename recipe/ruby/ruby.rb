%w(libffi-dev libreadline6-dev libssl-dev make zlib1g-dev).each do |pkg|
  package pkg
end

execute "su - -c '#{node[:rbenv][:path]}/bin/rbenv install #{node[:ruby][:version]}'" do
  # user "#{node[:user][:name]}"
  not_if "su - -c '#{node[:rbenv][:path]}/bin/rbenv versions' | grep #{node[:ruby][:version]}"
end

execute "su - -c 'rbenv global #{node[:ruby][:version]}'" do
  not_if "su - -c 'rbenv global' | grep #{node[:ruby][:version]}"
end
