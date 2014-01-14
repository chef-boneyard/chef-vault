@test "The secret file contains the secret value" {
  grep -qx 'success' /tmp/chef-vault-secret
}