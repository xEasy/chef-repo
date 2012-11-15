package 'git-core'
package 'zsh'

include_recipe 'nginx::source'

user node[:user][:name] do
  username "#{node[:user][:name]}"
  home "/home/#{node[:user][:name]}"
  gid 'admin'
  password "#{node[:user][:password]}"
  supports manage_home: true
  shell '/bin/zsh'
end

template "/home/#{node[:user][:name]}/.zshrc" do
  source 'zshrc.erb'
  owner node[:user][:name]
end
