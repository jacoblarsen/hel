require 'spec_helper'

# Dummy class for testing
class Stub < ActiveFedora::Base
  include Bibframe::Work
end

describe Bibframe::Work do
  describe 'On inclusion' do
    before :all do
      @stub = Stub.new
    end
    it 'should add Bibframe datastream' do
      expect(@stub.datastreams.keys).to include('bfMetadata')
    end

    it 'should add title method' do
      expect(@stub.respond_to?(:title)).to eql true
    end

    it 'should add a subtitle method' do
      expect(@stub.respond_to?(:subtitle)).to eql true
    end

    it 'should add a language method' do
      expect(@stub.respond_to?(:language)).to eql true
    end

    it 'should be able to save a title' do
      @stub.title = 'War and Peace'
      expect(@stub.title).to eql 'War and Peace'
    end
  end
end