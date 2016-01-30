package 'sl' do
  action :install
end

# shell
package 'zsh' do
  action :install
end

execute 'change shell' do
  command 'chsh -s /usr/bin/zsh'
          # echo vagrant'
end

include_recipe 'git.rb'
