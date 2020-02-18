default['audit']['fetcher'] = 'chef-server'
default['audit']['reporter'] = 'chef-server-automate'
default['audit']['profiles'] =
  case node['platform']
  when 'centos'
    default['audit']['profiles'] = [
      {
        name: 'DevSec Linux Security Baseline',
        compliance: 'admin/linux-baseline',
      },
      {
        name: 'CIS CentOS Linux 7 Benchmark Level 1',
        compliance: 'admin/cis-centos7-level1',
      },
    ]
  when 'ubuntu'
    default['audit']['profiles'] = [
      {
        name: 'DevSec Linux Security Baseline',
        compliance: 'admin/linux-baseline',
      },
      {
        name: 'CIS Ubuntu Linux 16.04 LTS Benchmark Level 1 - Server',
        compliance: 'admin/cis-ubuntu16.04lts-level1-server',
      },
    ]
  when 'windows'
    default['audit']['profiles'] = [
      {
        name: 'DevSec Windows Security Baseline',
        compliance: 'admin/windows-baseline',
      },
      {
        name: 'CIS Microsoft Windows Server 2012 R2 Benchmark Level 1 - Member Server',
        compliance: 'admin/cis-windows2012r2-level1-memberserver',
      },
    ]
  when 'redhat'
    default['audit']['profiles'] = [
      {
        name: 'DevSec Linux Security Baseline',
        compliance: 'admin/linux-baseline',
      },
      {
        name: 'CIS Red Hat Enterprise Linux 7 Benchmark Level 1 - Server',
        compliance: 'admin/cis-rhel7-level1-server',
      },
    ]
  end

#
#  Another example 
#


# Reporting and fetching options
# default['audit']['reporter'] = 'chef-server-automate'
# default['audit']['fetcher'] = 'chef-server'
# default['audit']['insecure'] = true
# # default['audit']['inspec_version'] = '1.30.0'

# default['audit']['profiles'].push 'name' => 'ssl',
#                                   'git' => 'https://github.com/dev-sec/linux-baseline.git'

# # Profile options
# case node['platform_family']
# when 'rhel'
#   case node['platform']
#   when 'redhat'
#     rh_role = File.read('/etc/redhat-release').chomp[/workstation/i] ? 'workstation' : 'server'
#     case node['platform_version']
#     when /^7\./
#       default['audit']['profiles'].push 'name' => "nov-rhel7-level1-#{rh_role}",'compliance' => "squirda1/nov-rhel7-level1-#{rh_role}"
#     when /^6\./
#       default['audit']['profiles'].push 'name' => "nov-rhel6-level1-#{rh_role}",'compliance' => "squirda1/nov-rhel6-level1-#{rh_role}"
#     end
#   when 'oracle'
#     case node['platform_version']
#     when /^6\./
#       default['audit']['profiles'].push 'name' => 'nov-oracle6-level1-server','compliance' => 'squirda1/nov-oracle6-level1-server'
#     end
#   end
# when 'windows'
#   case node['kernel']['os_info']['cs_info']['domain_role']
#   when '4', '5'
#     win_role = 'domaincontroller'
#   else
#     win_role = 'memberserver'
#   end

#   case node['platform_version']
#   when /^6.3/ # 2012R2
#     default['audit']['profiles'].push 'name' => "nov-windows2012r2-level1-#{win_role}", 'compliance' => "squirda1/nov-windows2012r2-level1-#{win_role}"
#   when /^6.1/ # 2008R2
#     default['audit']['profiles'].push 'name' => "nov-windows2008r2-level1-#{win_role}", 'compliance' => "squirda1/nov-windows2008r2-level1-#{win_role}"
#   end
# end
