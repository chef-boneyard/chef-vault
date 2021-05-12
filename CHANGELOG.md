# chef-vault

This file is used to list changes made in each version of the chef-vault cookbook.

## Unreleased

- Add support for Chef 17 by enabling `unified_mode` to resources
- Increase required Chef Infra Client version to >= 15.3
- Add `kitchen.dokken.yml` and enable Github CI testing
- Convert ServerSpec to InSpec

## 4.0.3 (2020-08-13)

- Add resource_name in addition to provides - [@tas50](https://github.com/tas50)

## 4.0.2 (2020-06-02)

- Cookstyle fixes including Chef Infra Client 16 compatibility - [@xorimabot](https://github.com/xorimabot)
  - resolved cookstyle error: resources/secret.rb:3:1 warning: `ChefDeprecations/ResourceUsesOnlyResourceName`
  - resolved cookstyle error: resources/secret.rb:11:44 refactor: `ChefRedundantCode/StringPropertyWithNilDefault`

## 4.0.0 (2020-01-02)

This cookkbook now requires Chef Infra Client 13.4+, which ships with the chef-vault gem out of the box. Since the gem is included out of the box we now skip the gem installation via the cookbook.

## 3.1.2 (2020-01-02)

This release restores compatibility with Chef releases before 13.x by installing chef-vault gem 3.x and removing the usage of .match? in the helper library. If you're on Chef 12 it is beyond time to upgrade. Chef 12 went EOL April 2018 and includes Ruby 2.3 which went EOL March 2019. Since that time multiple CVEs have come out in Ruby, openSSL, and several other libraries that are used by the chef-client. If you or your business value security then upgrade.

## 3.1.1 (2018-08-16)

- Documenting the chef_vault() method
- Fix Chef14 compatibility for chef_vault_secret resource

## 3.1.0 (2018-04-29)

- Remove compat_resource dependency that isn't used anymore
- Add "any" supports in metadata since this cookbook works on any platform
- Remove ChefSpec matchers since ChefSpec auto generates these now

## 3.0.0 (2017-06-02)

- Convert the LWRP to a custom resource and require Chef 12.9 or later
- Use a SPDX standard license string
- Resolve foodcritic warnings
- Switch testing to local delivery from Rake
- Update the readme with proper links to the chef-vault project

## 2.1.1 (2016-10-18)
- Fixes deletion of items using chef_vault_secret resource

## 2.1.0 (2016-10-14)
- Remove chef 11 compatibility in chef_gem usage
- adding options attribute to the chef_gem resource

## 2.0.0 (2016-09-16)
- Avoid deprecation notices
- Add chef_version metadata
- Testing updates
- Require Chef 12.1

## v1.3.3 (2016-03-14)

- Restore Chef 11 compatibility
- Fix installing chef-vault gems from a custom source
- Fix uninitialized constant error

## v1.3.2 (2015-10-22)

- Adding Chef 11 guards on provides methods

## v1.3.1 (2015-09-30)

- Refactor of the chef-vault resource, adding environment property
- Various test fixes

## v1.3.0 (2015-04-09)

- 28, Fixes chef vault item loading and regular data bag fallback
- 24, Add ability to specify source for chef-vault gem installation

## v1.2.5 (2015-03-19)

- 22, fixes `chef_gem` compile time usage, also in conjunction with `chef-sugar` and Chef 11

## v1.2.4 (2015-02-18)

- ripping out the `chef_gem` `compile_time` stuff

## v1.2.3 (2015-02-18)

- `chef_gem` `Chef::Resource::ChefGem.method_defined?(:compile_time)`

## v1.2.2 (2015-02-18)

- Fixing `chef_gem`c for Chef below 12.1.0

## v1.2.1 (2015-02-17)

- Being explicit about usage of the `chef_gem`'s `compile_time` property.
- Eliminating future deprecation warnings in Chef 12.1.0.

## v1.2.0 (2015-02-04)

- COOK-4672: Make the library helper into a module instead of adding into Chef::Recipe
- Prevent variable masking
- Fix inverted existence check for `current_resource`

## v1.1.5 (2014-09-25)

- Adding ChefVault::Exceptions::SecretDecryption exception handling

## v1.1.4 (2014-09-12)

- Fix loading of current resource in `chef_vault_secret` (Nathan Huff)
- Allow `chef_vault_item` to fall back to plain data bags
- Set default version of `chef-vault` gem to one required by libraries

## v1.1.2 (2014-06-02)

### Bug

- **[COOK-4591](https://tickets.opscode.com/browse/COOK-4591)** - resource to create chef-vault-encrypted-items in recipes

## v1.1.0 (2014-06-02)

- [COOK-4591]: add a resource to create chef-vault-encrypted-items in recipes

## v1.0.4 (2014-01-14)

- Provide an fallback to regular data bag item loading when a "development mode" attribute is set.

## v1.0.2 (2013-09-10)

- Add Chef::Recipe helper method (`chef_vault_item`)

## v1.0.0 (2013-09-10)

- Initial Release
