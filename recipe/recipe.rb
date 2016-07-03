package 'sl'

execute 'apt-get update'
# include_recipe 'golang.rb'

include_recipe 'git.rb'
include_recipe 'zsh.rb'
include_recipe 'vim.rb'
include_recipe 'ruby/rbenv.rb'
include_recipe 'ruby/ruby.rb'
include_recipe 'ruby/rubygems.rb'
include_recipe 'mysql.rb'
