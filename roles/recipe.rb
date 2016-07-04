# execute 'apt-get update'

## golang
# include_recipe '../cookbooks/golang.rb'

## git
# include_recipe '../cookbooks/git/git.rb'

## zsh
# include_recipe '../cookbooks/shell/zsh.rb'

## vim
# include_recipe '../cookbooks/editor/vim.rb'

## ruby
include_recipe '../cookbooks/ruby/rbenv.rb'
# include_recipe '../cookbooks/ruby/ruby.rb'
# include_recipe '../cookbooks/ruby/rubygems.rb'
# include_recipe '../cookbooks/ruby/rmagick.rb'
# include_recipe '../cookbooks/ruby/phantomjs.rb'

## nodejs
include_recipe '../cookbooks/nodejs/nodejs.rb'

## mysql
# include_recipe '../cookbooks/database/mysql.rb'
