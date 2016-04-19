package 'sl' do
  action :install
end

# include_recipe 'golang.rb'
include_recipe 'git.rb'
include_recipe 'zsh.rb'
include_recipe 'vim.rb'
# include_recipe 'sudo.rb'
include_recipe 'ruby/rbenv.rb'
