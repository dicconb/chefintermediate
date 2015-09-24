require_relative '../spec_helper.rb'

describe 'motd::default' do
  let(:chef_run) { ChefSpec::ServerRunner.converge(described_recipe) }	

  it 'Does not raise an error' do
    expect{chef_run}.not_to raise_error
  end

  it 'Creates motd file' do
    expect(chef_run).to create_template '/etc/motd'
  end
end