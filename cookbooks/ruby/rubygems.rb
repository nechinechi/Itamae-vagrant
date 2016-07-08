# package 'gcc-c++'

# %w(libxml2 libxslt libxml2-devel libxslt-devel).each do |pkg|
#   package pkg
# end

# %w(libxml2-dev libxslt-dev).each do |pkg|
#   package pkg
# end

# %w(build-essential patch ruby-dev zlib1g-dev liblzma-dev).each do |pkg|
#   package pkg
# end

# %w(libmysqld-dev libssl-dev libffi-dev).each do |pkg|
#   package pkg
# end

# %w(bison openssl curl zlib1g libyaml-dev nodejs).each do |pkg|
#   package pkg
# end

%w(bundler nokogiri rails pry).each do |gem|
  gem_package gem do
    options ['--no-ri', '--no-rdoc']
  end
end

# execute "su - -c 'gem update --system'"

# %w(nokogiri rails bundler pry).each do |gem|
#   execute "su - -c 'gem install #{gem}'" do
#     not_if "su - -c '#{gem} -v'"
#     user 'root'
#   end
# end
# %w(nokogiri rails bundler pry).each do |gem|
#   execute "gem install #{gem}" do
#     not_if "#{gem} -v"
#     user 'root'
#   end
# end
