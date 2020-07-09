default['audit']['fetcher'] = 'chef-server'
default['audit']['reporter'] = 'chef-server-automate'
default['audit']['profiles'] =
  case node['platform']
  when 'centos'
    default['audit']['waiver_file'] = '/home/centos/waiver.yml'
    default['audit']['profiles'] = [
      {
        name: 'DevSec Linux Security Baseline',
        compliance: 'workstation-1/linux-baseline',
      },
      {
        name: 'CIS CentOS Linux 7 Benchmark Level 1',
        compliance: 'workstation-1/cis-centos7-level1',
      },
    ]
  when 'ubuntu'
    default['audit']['profiles'] = [
      {
        name: 'DevSec Linux Security Baseline',
        compliance: 'workstation-1/linux-baseline',
      },
      {
        name: 'CIS Ubuntu Linux 16.04 LTS Benchmark Level 1 - Server',
        compliance: 'workstation-1/cis-ubuntu16.04lts-level1-server',
      },
    ]
  when 'windows'
    case  node['platform_version']
      when /^10/ # 2016
        default['audit']['waiver_file'] = 'c:\\waiver.yml'
        default['audit']['profiles'] = [
          {
           name: 'DevSec Windows Security Baseline',
           compliance: 'workstation-1/windows-baseline',
         },
          {
           name: 'CIS Microsoft Windows Server 2016 RTM (Release 1607) Benchmark Level 1 - Member Server',
           compliance: 'workstation-1/cis-windows2016rtm-release1607-level1-memberserver',
         },
        ]
      when /^6.3/ # 2012R2
        case node['policy_name'] ## 
          when 'base_windows2012_acsc'
            default['audit']['profiles'] = [
              {
              name: 'Australian Government Information Security Manual',
              compliance: 'workstation-1/acsc_ism_baseline',
            },
            ]
          else
            default['audit']['waiver_file'] = 'c:\\waiver.yml'
            default['audit']['profiles'] = [
              {
              name: 'DevSec Windows Security Baseline',
              compliance: 'workstation-1/windows-baseline',
            },
              {
              name: 'CIS Microsoft Windows Server 2012 R2 Benchmark Level 1 - Member Server',
              compliance: 'workstation-1/cis-windows2012r2-level1-memberserver',
            },
            ]
        end
  end
  when 'redhat'
    default['audit']['profiles'] = [
      {
        name: 'DevSec Linux Security Baseline',
        compliance: 'workstation-1/linux-baseline',
      },
      {
        name: 'CIS Red Hat Enterprise Linux 7 Benchmark Level 1 - Server',
        compliance: 'workstation-1/cis-rhel7-level1-server',
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
