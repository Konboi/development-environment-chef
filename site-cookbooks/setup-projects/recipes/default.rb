#
# Cookbook Name:: setup-projects
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

projects = data_bag("projects")

projects.each do |prj|
  project = data_bag_item("projects", prj)

  bash "clone project #{project["id"]}" do
    user  node["user"]["name"]
    group node["user"]["name"]
    cwd   node["user"]["home"]

    if project["type"] == "svn"
      code <<-EOF
      cd   #{node["user"]["home"]}/project
      echo #{project["password"]} | git svn clone --username #{project["user_name"]} #{project["repository"]} #{project["id"]}
      EOF
    end

    not_if "ls -l #{node["user"]["home"]}/project | grep #{project["id"]}"
  end

end
