require 'spec_helper'

describe CampfireChat::Configuration do
  let(:config_hash) { {:room => 'room', :token => 'token', :subdomain => 'subdomain'} }
  let(:config) { described_class.new(config_hash) }

  describe '#add_pair' do
    it 'adds an engineer to the pairs' do
      config.add_pair 'Fred'
      config.pairs.should have(1).pair
      config.pairs.first.name.should == 'Fred'
    end
  end

  describe '#room' do
    it 'returns the campfire room' do
      config.room.should == config_hash[:room]
    end
  end

  describe '#token' do
    it 'returns the campfire token' do
      config.token.should == config_hash[:token]
    end
  end

  describe '#subdomain' do
    it 'returns the campfire subdomain' do
      config.subdomain.should == config_hash[:subdomain]
    end
  end

  describe '.build' do
    context 'when a valid config file is present' do
      let(:path) { fixture_path('campfire.yml') }
      it 'loads configurations from the YAML file' do
        config = described_class.build(path)
        config.room.should == 'some room'
        config.token.should == 'the-token'
        config.subdomain.should == 'the-subdomain'
      end
    end

  end

end
