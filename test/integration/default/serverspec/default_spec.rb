require 'spec_helper'

describe file('/tmp/chef-vault-secret') do
  its(:content) { should match(/success/) }
end

describe file('/tmp/chef-vault-environment-secret') do
  its(:content) { should match(/unicorn/) }
end

describe file('/tmp/chef-vault-secret-from-library') do
  its(:content) { should match(/success/) }
end

describe file('/tmp/chef-vault-secret-no-fallback') do
  its(:content) { should match(/exception raised/) }
end

describe file('/tmp/chef-vault-environment-secret-from-library') do
  its(:content) { should match(/unicorn/) }
end

describe file('/tmp/chef-vault-items') do
  its(:content) { should match(/bacon,dbpassword/) }
end

describe file('/tmp/chef-vault-items-from-library') do
  its(:content) { should match(/bacon,dbpassword/) }
end
