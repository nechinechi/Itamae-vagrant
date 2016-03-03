# execute 'git clone https://github.com/nechinechi.vim.git' do
git 'clone .vim' do
  # user node[:user][:name]
  destination '.vim'
  repository 'https://github.com/nechinechi/.vim.git'
  not_if 'test -e .vim'
  # revision 'HEAD'
end

execute "sudo chown -hR #{node[:user][:name]}:#{node[:user][:group]} .vim" do
  # user node[:user][:name]
  only_if 'test -e .vim'
end

link '.vimrc' do
  # user node[:user][:name]
  to '~/.vim/.vimrc'
  only_if 'test -e .vim'
  not_if 'test -e .vimrc'
end

execute "sudo chown #{node[:user][:name]}:#{node[:user][:group]} .vimrc" do
  # user node[:user][:name]
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

execute "sudo chown -hR #{node[:user][:name]}:#{node[:user][:group]} ~/.vim/bundle" do
  # user node[:user][:name]
  # cwd '~/.vim'
  only_if 'test -e .vim/bundle'
end
