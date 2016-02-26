# execute 'git clone https://github.com/nechinechi.vim.git' do
git 'clone .vim' do
  destination '.vim'
  repository 'https://github.com/nechinechi/.vim.git'
  not_if 'test -e .vim'
  # revision 'HEAD'
end

execute "sudo chown -hR #{node["user"]} .vim" do
  only_if 'test -e .vim'
end

link '.vimrc' do
  to '~/.vim/.vimrc'
  only_if 'test -e .vim'
  not_if 'test -e .vimrc'
end

execute "sudo chown -hR #{node["user"]} .vimrc" do
  only_if 'test -e .vimrc'
end
