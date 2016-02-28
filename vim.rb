# execute 'git clone https://github.com/nechinechi.vim.git' do
git 'clone .vim' do
  destination '.vim'
  repository 'https://github.com/nechinechi/.vim.git'
  not_if 'test -e .vim'
  # revision 'HEAD'
end

# execute "sudo chown -hR #{node["user"]} .vim" do
execute "sudo chown -hR vagrant .vim" do
  only_if 'test -e .vim'
end

link '.vimrc' do
  to '~/.vim/.vimrc'
  only_if 'test -e .vim'
  not_if 'test -e .vimrc'
end

# execute "sudo chown -hR #{node["user"]} .vimrc" do
execute "sudo chown -hR vagrant .vimrc" do
  only_if 'test -e .vimrc'
end

execute 'mkdir .vim/bundle' do
  not_if 'test -e .vim/bundle'
end

git 'clone neobundle' do
  destination '.vim/bundle/neobundle.vim'
  repository 'https://github.com/Shougo/neobundle.vim.git'
  not_if 'test -e .vim/bundle/neobundle.vim'
  # revision 'HEAD'
end
