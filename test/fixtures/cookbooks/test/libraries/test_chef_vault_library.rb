module TestChefVaultLibrary

  def test_chef_vault
    chef_vault_item('secrets', 'dbpassword')
  end

end

class Chef::Recipe ; include TestChefVaultLibrary ; end
class Chef::Resource ; include TestChefVaultLibrary ; end
