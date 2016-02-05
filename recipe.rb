package 'sl' do
  action :install
end

include_recipe 'zsh.rb'
include_recipe 'git.rb'
include_recipe 'vim.rb'
