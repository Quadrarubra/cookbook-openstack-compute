name 'openstack-compute'
maintainer 'openstack-chef'
maintainer_email 'openstack-dev@lists.openstack.org'
license 'Apache 2.0'
description 'The OpenStack Compute service Nova.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '12.0.2'

recipe 'openstack-compute::api-ec2', 'Installs AWS EC2 compatible API'
recipe 'openstack-compute::api-metadata', 'Installs the nova metadata package'
recipe 'openstack-compute::api-os-compute', 'Installs OS API'
recipe 'openstack-compute::client', 'Install nova client packages'
recipe 'openstack-compute::compute', 'nova-compute service'
recipe 'openstack-compute::conductor', 'Installs nova conductor service'
recipe 'openstack-compute::libvirt', 'Installs libvirt, used by nova compute for management of the virtual machine environment'
recipe 'openstack-compute::libvirt_rbd', 'Manages the RBD portions of libvirt. Included by openstack-compute::libvirt'
recipe 'openstack-compute::identity_registration', 'Registers the API and EC2 endpoints with Keystone'
recipe 'openstack-compute::network', 'Installs nova network service'
recipe 'openstack-compute::nova-cert', 'Installs nova-cert service'
recipe 'openstack-compute::nova-common', 'Builds the basic nova.conf config file with details of the rabbitmq, mysql, glance and keystone servers'
recipe 'openstack-compute::nova-setup', 'Sets up the nova database on the mysql server, including the initial schema and subsequent creation of the appropriate networks'
recipe 'openstack-compute::scheduler', 'Installs nova scheduler service'
recipe 'openstack-compute::vncproxy', 'Installs and configures the vncproxy service for console access to VMs'
recipe 'openstack-compute::serialproxy', 'Installs and configures the serialproxy service for serial console access to VMs'

%w(ubuntu fedora redhat centos suse).each do |os|
  supports os
end

depends 'ceph', '>= 0.8.1'
depends 'openstack-bare-metal', '>= 12.0.0'
depends 'openstack-common', '>= 12.0.0'
depends 'openstack-identity', '>= 12.0.0'
depends 'openstack-image', '>= 12.0.0'
depends 'openstack-network', '>= 12.0.0'
depends 'selinux', '~> 0.9.0'
depends 'python', '~> 1.4.6'
