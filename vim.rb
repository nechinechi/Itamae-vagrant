execute 'git clone https://github.com/nechinechi/.vim.git' do
  not_if 'test -e .vim'
end
# git 'clone .vim' do
#   destination '~/'
#   repository 'git@github.com:nechinechi/.vim.git'
#   revision 'HEAD'
#   only_if 'test -e .vim'
# end

execute 'ln -s .vim/.vimrc' do
  not_if 'test -e .vimrc'
end
