#
# Cookbook Name:: chef-vault
# Library:: chef_vault_item
#
# Author: Joshua Timberman <joshua@opscode.com>
#
# Copyright (c) 2013, Opscode, Inc.
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


class Chef
  class Recipe
    # This is a nice helper method for the Chef Recipe DSL so you can
    # write:
    #   chef_vault_item("secrets", "dbpassword")
    # Instead of:
    #   ChefVault::Item.load("secrets", "dbpassword")
    #
    def chef_vault_item(bag, item)
      begin
        require 'chef-vault'
      rescue LoadError
        Chef::Log.warn("Missing gem 'chef-vault', use recipe[chef-vault] to install it first.")
      end

      ChefVault::Item.load(bag, item)
    end
  end
end
