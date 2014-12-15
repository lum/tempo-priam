#
# Cookbook Name:: tempo-priam
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Setup SSD 
include_recipe "ebs::priam-ssd"

include_recipe "cassandra-priam"

# Setup Cassandra Schema
include_recipe "tempo-priam::schema"

