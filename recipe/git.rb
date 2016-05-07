package 'git'

# global 設定
confirm = '# done provisioning with Itamae'
[
  %(user.name "#{node[:git][:username]}"),
  %(user.email "#{node[:git][:e_mail]}"),
  "core.editor vim",
  "push.default current"
].each do |setting|
  # execute %(git config --global user.name "#{node[:git][:username]}")
  # execute %(git config --global user.email "#{node[:git][:e_mail]}")
  # execute 'git config --global core.editor vim'
  # execute 'git config --global push.default current'
  execute "git config --global #{setting}" do
    not_if "grep '#{confirm}' .gitconfig"
  end
end

execute "echo '#{confirm}' >> .gitconfig" do
  not_if "grep '#{confirm}' .gitconfig"
end
