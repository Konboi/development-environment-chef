include_recipe 'users'

users_manage "vagrant" do
  group_id 650
  action [ :remove, :create ]
end


directory '/home/vagrant' do
  mode 0755
  owner 'vagrant'
  group 'vagrant'
  recursive false
end
