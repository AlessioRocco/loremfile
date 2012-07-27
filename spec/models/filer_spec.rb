require 'spec_helper'

class MockFiler
  def initialize(*args)
  end
end

describe Filer do
  
  describe ".new" do
    
    context "when class exists" do
      
      it "istantiate the right class based on first parameter (extension)" do
        MockFiler.should_receive(:new).with("file_name", an_instance_of(Hash))
        Filer.new "file_name", "mock"
      end
      
      it "assigns the object to instance variable" do
        filer = Filer.new "file_name", "mock"
        filer.file_creator.should be_an_instance_of(MockFiler)
      end      
    end
      
    context "when class doesn't exists" do
      
      it "raise an exception" do
        expect { Filer.new("file_name", "wrong_mock") }.to raise_error
      end
      
    end
    
  end
  
  describe "#create" do
    it "delegates to file_creator" do
      filer = Filer.new "file_name", "mock"
      filer.file_creator.should_receive(:create)
      filer.create
    end
  end
  
end