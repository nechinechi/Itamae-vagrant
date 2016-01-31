package 'zsh' do
  action :install
end

execute 'change shell' do
  command 'chsh -s /usr/bin/zsh'
          # echo vagrant'
end

execute 'git clone https://github.com/nechinechi/dotfiles.git .dotfiles'

execute 'ln -s .dotfiles/.zshrc'
