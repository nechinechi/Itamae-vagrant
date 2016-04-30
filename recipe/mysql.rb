package 'mysql-server'

execute 'cp my.cnf my.cnf.org' do
  cwd '/etc/mysql'
  not_if 'test -e my.cnf.org'
end

# user 作成(not_if は未完成)
execute 'create mysql user' do
  command <<-EOL
mysql -u root -e 'GRANT ALL ON *.* TO vagrant@"localhost"'
mysql -u root -e 'FLUSH PRIVILEGES'
  EOL
  not_if "mysql -u root -e 'SELECT user FROM mysql.user WHERE user=\"#{node[:mysql][:user][:vagrant][:name]}\"'
          | grep #{node[:mysql][:user][:vagrant][:name]}"
end

# server_set = <<-EOS
# [mysqld]
# skip-character-set-client-handshake
# character-set-server = utf8
# collation-server     = utf8_general-ci
# init-connect         = SET NAMES utf8
# EOS
# 
# file "#{node[:mysql][:path]}/my.cnf" do
#   action :edit
#   block do |content|
#     content.gsub!("[mysqld]", "#{server_set}")
#   end
#   # not_if "grep #{server_set} my.cnf"
# end
