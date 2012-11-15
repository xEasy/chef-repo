package 'git-core'
package 'zsh'

include_recipe 'nginx::source'

user 'deployer' do
  home "/home/deployer"
  gid 'admin'
  password "123"
  supports manage_home: true
  shell '/bin/zsh'
end

template "/home/deployer/.zshrc" do
  source 'zshrc.erb'
  owner 'deployer'
end
