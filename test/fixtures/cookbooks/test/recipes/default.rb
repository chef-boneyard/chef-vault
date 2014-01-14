# This will fall back to loading the data bag item w/o vault.
secret = chef_vault_item('secrets', 'dbpassword')

file '/tmp/chef-vault-secret' do
  content secret['auth']
end
