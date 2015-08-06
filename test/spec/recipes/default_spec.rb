require 'spec_helper'

describe_recipe 'chef-vault::default' do
  cached(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
  context 'with default attributes' do
    it { expect(chef_run).to install_chef_gem('chef-vault') }
  end

  context "with node['chef-vault']['version'] = '~> 1337.0'" do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new do |node|
        node.set['chef-vault']['version'] = '~> 1337.0'
      end.converge(described_recipe)
    end

    it { expect(chef_run).to install_chef_gem('chef-vault').with(version: '~> 1337.0') }
  end

  context "with node['chef-vault']['gem_source'] = 'https://foo.bar.baz'" do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new do |node|
        node.set['chef-vault']['gem_source'] = 'https://foo.bar.baz'
      end.converge(described_recipe)
    end

    it { expect(chef_run).to install_chef_gem('chef-vault').with(source: 'https://foo.bar.baz') }
  end
end
