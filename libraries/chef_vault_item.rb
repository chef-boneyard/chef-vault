#
# Cookbook Name:: chef-vault
# Library:: chef_vault_item
#
# Author: Joshua Timberman <joshua@opscode.com>
#
# Copyright (c) 2013, Opscode, Inc.
# Copyright (c) 2014, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


module ChefVaultItem
  # This is a nice helper method for the Chef Recipe DSL so you can
  # write:
  #   chef_vault_item("secrets", "dbpassword")
  # Instead of:
  #   ChefVault::Item.load("secrets", "dbpassword")
  #
  # Falls back to normal data bag item loading if the item isn't actually a
  # vault item.
  def chef_vault_item(bag, item, fallback = true)
    begin
      require 'chef-vault'

      ChefVault::Item.load(bag, item)
    rescue LoadError, ChefVault::Exceptions::KeysNotFound => err
      Chef::Log.warn("Missing gem 'chef-vault', use recipe[chef-vault] to install it first.") if err.kind_of? LoadError
      if fallback
        Chef::Log.warn("Failed to load vault item #{item} from #{bag}, falling back to data bags.")
        raise "Found a data bag item for #{item}_keys, refusing to fallback to data bag" if Chef::DataBag.load(bag).key? "#{item}_keys"
        Chef::DataBagItem.load(bag, item)
      else
        raise 'Unable to load vault item and databag fallback is disabled'
      end
    end
  end
end

class Chef::Recipe ; include ChefVaultItem ; end
class Chef::Resource ; include ChefVaultItem ; end
