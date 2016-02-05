package 'zsh' do
  action :install
end

# execute 'change shell' do
#   command 'chsh -s /usr/bin/zsh'
#           # echo vagrant'
# end

execute 'git clone https://github.com/nechinechi/dotfiles.git .dotfiles' do
  not_if 'test -e .dotfiles'
end

execute 'ln -s .dotfiles/.zshrc' do
  not_if 'test -e .zshrc'
end

user 'change shell to zsh' do
  username 'vagrant'  # username の指定がなければ、user resource の後の文字列が入る
  password 'vagrant'
  shell '/usr/bin/zsh'
end