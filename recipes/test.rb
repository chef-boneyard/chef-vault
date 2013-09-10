begin
  chef_vault_item("secrets", "dbpassword")
  return
rescue Chef::Exceptions::InvalidDataBagPath
  Chef::Log.warn("I expected an invalid data bag path, which comes from ChefVault,")
  Chef::Log.warn("so if you're seeing this, that is the correct thing and we're done here.")
  Chef::Log.warn("This is just a test recipe for test kitchen, so don't use it on any nodes.")
end
