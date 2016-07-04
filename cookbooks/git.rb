package 'git'

# global 設定
confirm = '# provisioned with Itamae'
[
  "user.name '#{node[:git][:username]}'",
  "user.email '#{node[:git][:e_mail]}'",
  "core.editor vim",
  "push.default current",
  "pull.default current"
].each do |setting|
  execute "git config --global #{setting}" do
    not_if "grep '#{confirm}' .gitconfig"
  end
end

execute "echo '#{confirm}' >> .gitconfig" do
  not_if "grep '#{confirm}' .gitconfig"
end
