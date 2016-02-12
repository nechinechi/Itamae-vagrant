package 'zsh' do
  action :install
end

git '~/.dotfiles' do
  destination '~/.dotfiles'
  repository 'git://github.com/nechinechi/dotfiles.git'
  not_if 'test -e /home/vagrant/.rbenv'
end

link '.zshrc' do
  to '~/.dotfiles/.zshrc'
  not_if 'test -e .zshrc'
end

user 'change shell to zsh' do
  username 'vagrant'  # username の指定がなければ、user resource の後の文字列が入る
  password 'vagrant'
  shell '/usr/bin/zsh'
end
