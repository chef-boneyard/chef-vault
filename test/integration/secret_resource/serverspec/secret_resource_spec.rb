require 'spec_helper'

describe 'chef_vault_secret resource' do
  describe command('cd $BUSSER_ROOT/../kitchen && knife vault show green clean-energy -z -u hydroelectric -k clients/hydroelectric.pem') do
    its(:exit_status) { should eq 0 }
  end

  describe command('cd $BUSSER_ROOT/../kitchen && knife vault show green dirty-energy -z -u hydroelectric -k clients/hydroelectric.pem') do
    its(:exit_status) { should eq 0 }
  end
end
