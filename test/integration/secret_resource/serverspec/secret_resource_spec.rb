require_relative '../../../kitchen/data/spec_helper'

describe 'chef_vault_secret resource' do
  describe command('knife vault show green clean-energy -z -u hydroelectric -k clients/hydroelectric.pem') do
    let(:pre_command) { "cd #{ENV['BUSSER_ROOT']}/../kitchen" }
    it { should return_exit_status 0 }
  end
end
