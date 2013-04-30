require 'spec_helper'

describe CampfireChat::Engineer do
  let(:attributes) { {:name => 'Bob'}}
  let(:engineer) { described_class.new(attributes) }
  describe '#name' do
    it 'returns the name of the engineer' do
      engineer.name.should == attributes[:name]
    end
  end
end
