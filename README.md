chef-vault Cookbook
===================

This cookbook is responsible for installing the `chef-vault` gem and
providing some helper methods to load encrypted data bags that are in
The Vault.

Chef Vault is a library by Nordstrom's infrastructure operations team
that helps manage encrypted data bags.

* https://github.com/Nordstrom/chef-vault

## Requirements

This cookbook should work on any system/platform that is supported by
Chef.

## Helper Method

This cookbook provides a nice helper method for the Chef Recipe DSL so
you can write:

    chef_vault_item("secrets", "dbpassword")

Instead of:

    ChefVault::Item.load("secrets", "dbpassword")

This has logic to allow for development and testing of recipes, see
__Attributes__ below.

## Attributes

* `node['chef-vault']['version']` - Specify a version of the
  chef-vault gem if required. Default is `nil`, so the latest version
  will be installed.

The following attribute is special and not specifically related to
this cookbook, but is used in the helper.

* `node['dev_mode']` - If this is true, `chef_vault_item` will attempt
  to load the specified item as a regular Data Bag Item with
  `Chef::DataBagItem.load`. This is intended to be used only for
  testing, and not as a fall back to avoid issues loading encrypted
  items.

## Usage

Include the recipe before using the Chef Vault library in recipes.

    include_recipe 'chef-vault'
    secret_stuff = ChefVault::Item.load("secrets", "a_secret")

Or, use the helper library method:

    secret_stuff = chef_vault_item("secrets", "a_secret")

If you need a specific version of the `chef-vault` RubyGem, then
specify it with the attribute, `node['chef-vault']['version']`.

## Contributing

This repository contains a `CONTRIBUTING` file that describes the
contribution process for Chef cookbooks.

## License and Authors

- Author: Joshua Timberman <joshua@getchef.com>
- Copyright (c) 2013 Opscode, Inc. <legal@opscode.com>
- Copyright (c) 2014 Chef Software, Inc. <legal@getchef.com>

License:: Apache License, Version 2.0

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
