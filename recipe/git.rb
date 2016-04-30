package 'git'

# 設定
execute %(git config --global user.name "#{node[:git][:username]}")
execute %(git config --global user.email "#{node[:git][:e_mail]}")
execute 'git config --global core.editor vim'
execute 'git config --global push.default current'

