#
# Cookbook:: audit-wrapper
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

case node['os']
when 'linux'
  if node['platform_family'] == 'rhel'
    node.override['audit']['profiles'] = [ {"name" => "CIS Red Hat Enterprise Linux 7 Benchmark Level 1 - Server", "compliance" => "admin/cis-rhel7-level1-server"}]
  else
    node.override['audit']['profiles'] = [ {"name" => "linux-baseline", "compliance" => "admin/linux-baseline"}]
  end
when 'windows'
  node.override['audit']['profiles'] = [ {"name" => "CIS Microsoft Windows Server 2012 R2 Benchmark Level 1 - Member Server", "compliance" => "admin/cis-windows2012r2-level1-memberserver"}]
end

include_recipe 'audit'
