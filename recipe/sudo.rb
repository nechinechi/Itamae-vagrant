# file "/etc/sudoers" do
#   action :edit
#   block do |content|
#     # content.gsub!("Defaults>-env_reset", "# Defaults>-env_reset")
#     content.gsub!(/^Defaults>-env_reset/, "# \&")
#   end
# end

# sudoers のパーミッション変更は絶対ダメ
# execute 'chmod ug+w /etc/sudoers'

# execute %q(sed -ei 's/Defaults>-env_reset/# \0/g' sudoers) do
#   cwd '/etc'
#   only_if %q(grep '^Defaults' sudoers | grep 'env_reset')
# end
