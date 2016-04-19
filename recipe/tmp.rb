file 'sample_text' do
  action :create
  content 'this is juxt a random file'
  not_if 'test -e sample_text'
end

file 'sample_text' do
  action :edit
  block do |content|
    content.gsub!(/^hey.*$/, 'hello')
  end
end

# file 'tets' do
#   action :edit
#   block do |content|
#     content.gsub!(/^kkkk$/, '# \&')
#   end
# end
