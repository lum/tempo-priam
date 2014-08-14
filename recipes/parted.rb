#
# Cookbook Name:: tempo-priam
# Recipe:: parted	
#
# Copyright 2014, tempo-priam
#
# All rights reserved - Do Not Redistribute
#

include_recipe "parted"


parted_disk "#{node[:cassandra][:parted][:disk]}" do
  label_type "#{node[:cassandra][:parted][:label]}"
  action :mklabel
end

parted_disk "#{node[:cassandra][:parted_disk]}" do
  file_system "#{node[:cassandra][:parted][:filesystem_type]}"
  action :mkfs
end