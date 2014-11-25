class Chef::Resource::RubyBlock
    include PortTest
end

ruby_block "checking cassandra cli port" do
  block do
    port_check?( node[:ipaddress], 9160, 10 )
  end
end

template "#{node.cassandra[:home_dir]}/conf/cassandra-schema.txt" do
  source "cassandra-schema.txt.erb"
  mode 0644
  owner "cassandra"
end

# create the schema if this is the first node of a cassandra ring, or if this is NOT part of a ring (i.e. uber)
#if node['name'].include?('cassandra1') || !node['name'].include?('cassandra')
  execute "Trying to create Tempo schema..." do
    cwd     node.cassandra[:home_dir]
    user    'root'
    command "echo \"show keyspaces;\" | bin/cassandra-cli -h #{node[:ipaddress]} | grep \"Keyspace: tempo:\"
        if [ $? -eq 0 ]; then
            exit 0
        fi
        bin/cassandra-cli -h #{node[:ipaddress]} -B -f #{node.cassandra[:home_dir]}/conf/cassandra-schema.txt"
  end
#end
