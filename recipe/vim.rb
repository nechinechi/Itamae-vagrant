# execute 'git clone https://github.com/nechinechi.vim.git' do
git 'clone .vim' do
  # user node[:user][:name]
  destination "#{node[:vim][:dir]}"
  repository 'https://github.com/nechinechi/.vim.git'
  not_if "test -d #{node[:vim][:dir]}"
  # revision 'HEAD'
end

execute "sudo chown -hR #{node[:user][:name]}:#{node[:user][:group]} .vim" do
  only_if 'test -d .vim'
end

link '.vimrc' do
  # user node[:user][:name]
  to "#{node[:vim][:dir]}/.vimrc"
  only_if 'test -d .vim'
  not_if 'test -L .vimrc'
end

execute "sh ./installer.sh #{node[:vim][:dein_dir]}" do
  cwd "/usr/#{node[:user][:name]}/#{node[:vim][:dir]}"
  not_if "test -d #{node[:vim][:dein_dir]}"
end

# execute "sudo chown #{node[:user][:name]}:#{node[:user][:group]} .vimrc" do
#   # user node[:user][:name]
#   only_if 'test -e .vimrc'
# end

# bundle install
# execute 'mkdir .vim/bundle' do
#   not_if 'test -d .vim/bundle'
# end
# 
# git 'clone neobundle' do
#   destination '.vim/bundle/neobundle.vim'
#   repository 'https://github.com/Shougo/neobundle.vim.git'
#   not_if 'test -d .vim/bundle/neobundle.vim'
#   # revision 'HEAD'
# end
# 
# execute "sudo chown -hR #{node[:user][:name]}:#{node[:user][:group]} ~/.vim/bundle" do
#   # user node[:user][:name]
#   # cwd '~/.vim'
#   only_if 'test -d .vim/bundle'
# end
