%w(imagemagick libmagickwand-dev).each do |pkg|
  package pkg
end

# execute "su - -c 'gem install rmagick --no-ri --no-rdoc'" do
#   not_if "su - -c 'gem list' | grep rmagick"
# end

execute "gem install rmagick --no-ri --no-rdoc" do
  not_if "gem list | grep rmagick"
  user 'root'
end
