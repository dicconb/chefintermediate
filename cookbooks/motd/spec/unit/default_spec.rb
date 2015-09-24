require_relative '../spec_helper.rb'

describe 'motd::default' do
  let(:chef_run) { ChefSpec::ServerRunner.converge(described_recipe) }	
  let(:runner) { ChefSpec::ServerRunner.new(REDHAT_OPTS)}
  let(:node) { runner.node }

  cached(:chef_run) do
  	node.default['something'] = 'foo'
    allow(File).to receive('exist?').and_call_original
    allow(File).to receive('exist?').with('/tmp/missing').and_return(true)

  	runner.converge(described_recipe)
  end

  it 'Does not raise an error' do
    expect{chef_run}.not_to raise_error
  end

  it 'Creates motd file' do
    expect(chef_run).to create_template '/etc/motd'
  end

  it 'Creates Diccon file' do
    expect(chef_run).to create_file '/tmp/diccon'
  end

  it 'Echoes 1' do
  	expect(chef_run).to run_execute 'dicconexecute' 
  end
end
