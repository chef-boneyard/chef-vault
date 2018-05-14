module TestChefVaultLibrary
  def test_chef_vault_item
    chef_vault_item('secrets', 'dbpassword')
  end

  def test_chef_vault
    chef_vault('secrets')
  end

  def test_chef_vault_for_environment
    chef_vault_item_for_environment('secrets', 'bacon')
  end
end

class Chef::Recipe; include TestChefVaultLibrary; end
class Chef::Resource; include TestChefVaultLibrary; end
