package 'zsh' do
  action :install
end

git 'clone .dotfiles' do
  # user node[:user][:name]
  destination '.dotfiles'
  repository 'https://github.com/nechinechi/dotfiles.git'
  not_if 'test -e .dotfiles'
end

execute "sudo chown -hR #{node[:user][:name]}:#{node[:user][:group]} .dotfiles" do
  # user node[:user][:name]
  only_if 'test -e .dotfiles'
end

link '.zshrc' do
  # user node[:user][:name]
  to '~/.dotfiles/.zshrc'
  only_if 'test -e .dotfiles'
  not_if 'test -e .zshrc'
end

execute "sudo chown #{node[:user][:name]}:#{node[:user][:group]} .zshrc" do
  # user node[:user][:name]
  only_if 'test -e .zshrc'
end

user 'change shell to zsh' do
  # username の指定がなければ、user resource の後の文字列が入る
  username node[:user][:name]
  password node[:user][:passwd]
  shell '/usr/bin/zsh'
end
