name 'chef-vault'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache-2.0'
description 'Installs the chef-vault gem and provides chef_vault_item recipe helper'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '3.0.0'

source_url 'https://github.com/chef-cookbooks/chef-vault'
issues_url 'https://github.com/chef-cookbooks/chef-vault/issues'
chef_version '>= 12.9'

depends 'compat_resource', '>= 12.16.3'
gem 'chef-vault'
