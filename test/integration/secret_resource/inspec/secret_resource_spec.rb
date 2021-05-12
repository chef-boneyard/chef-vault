# TODO: Chef Infra Client no longer ships knife so we need another way to test this
# describe command('knife vault show green clean-energy -z -u hydroelectric -k clients/hydroelectric.pem') do
#   its(:exit_status) { should eq 0 }
# end
#
# describe command('knife vault show green dirty-energy -z -u hydroelectric -k clients/hydroelectric.pem') do
#   its(:exit_status) { should eq 0 }
# end
