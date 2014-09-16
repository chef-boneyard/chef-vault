require_relative '../../../kitchen/data/spec_helper'

describe 'chef-vault::default' do
  describe file('/tmp/chef-vault-secret') do
    its(:content) { should match(/success/) }
  end

  describe file('/tmp/chef-vault-secret-from-library') do
    its(:content) { should match(/success/) }
  end

end
