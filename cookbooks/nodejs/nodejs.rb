package 'nodejs'
package 'npm'

execute 'npm -g update npm'

execute 'install n' do
  command <<-EOF
    npm cache clean
    npm -g install n
  EOF
  not_if 'which n'
end

stable_version = run_command('n --stable', error: false).stdout
node_version = run_command('node -v', error: false).stdout
node_version.slice!(0)
if node_version != stable_version
  execute 'install stable version of nodejs' do
    command 'n stable'
  end
end
