package 'zsh' do
  action :install
end

git 'clone .dotfiles' do
  destination '.dotfiles'
  repository 'https://github.com/nechinechi/dotfiles.git'
  not_if 'test -e .dotfiles'
end

link '.zshrc' do
  to '~/.dotfiles/.zshrc'
  only_if 'test -e .dotfiles'
  not_if 'test -e .zshrc'
end

user 'change shell to zsh' do
  username 'vagrant'  # username の指定がなければ、user resource の後の文字列が入る
  password 'vagrant'
  shell '/usr/bin/zsh'
end
