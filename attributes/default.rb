default['audit']['fetcher'] = 'chef-server'
default['audit']['reporter'] = 'chef-server-automate'
default['audit']['profiles'] =
  case node['platform']
  when 'centos'
    default['audit']['profiles'] = [
      {
        name: 'DevSec Linux Security Baseline',
        compliance: 'admin@example.com/linux-baseline',
      },
      {
        name: 'CIS CentOS Linux 7 Benchmark Level 1',
        compliance: 'admin@example.com/cis-centos7-level1',
      },
    ]
  when 'ubuntu'
    default['audit']['profiles'] = [
      {
        name: 'DevSec Linux Security Baseline',
        compliance: 'admin@example.com/linux-baseline',
      },
      {
        name: 'CIS Ubuntu Linux 16.04 LTS Benchmark Level 1 - Server',
        compliance: 'admin@example.com/cis-ubuntu16.04lts-level1-server',
      },
    ]
  when 'windows'
    default['audit']['profiles'] = [
      {
        name: 'DevSec Windows Security Baseline',
        compliance: 'admin@example.com/windows-baseline',
      },
      {
        name: 'CIS Microsoft Windows Server 2012 R2 Benchmark Level 1 - Member Server',
        compliance: 'admin@example.com/cis-windows2012r2-level1-memberserver',
      },
    ]
  when 'redhat'
    default['audit']['profiles'] = [
      {
        name: 'DevSec Linux Security Baseline',
        compliance: 'admin@example.com/linux-baseline',
      },
      {
        name: 'CIS Red Hat Enterprise Linux 7 Benchmark Level 1 - Server',
        compliance: 'admin@example.com/cis-rhel7-level1-server',
      },
    ]
  end
