require 'spec_helper'

module Filer
  class MockFiler
    def initialize(name,size)
    end
  end
end

describe FilersController do
  
  describe "GET #show" do
    
    let(:filer){mock(Filer::MockFiler).as_null_object}
     
    before do
       Filer::MockFiler.stub(:new).and_return(filer)
       File.open("#{Rails.root}/tmp/test_file", "w")
       filer.stub(:create).and_return("#{Rails.root}/tmp/test_file")
    end
    
    it "doesn't render nothing" do
      response.body.should be_blank
    end
    
    context "when requested file extension exists" do                              
      it "instantiates new Filer class based on ext param" do
        Filer::MockFiler.should_receive(:new).with("file_name", 1000).and_return(filer)
        get :show, {:name => "file_name", :ext => "mock", :size => 1000}
      end
      
      it "creates the file" do
        filer.should_receive(:create)
        get :show, {:name => "file_name", :ext => "mock", :size => 1000}
      end
      
      it "sends requested file" do
        controller.should_receive(:send_file).and_return{controller.render :nothing => true}
        get :show, {:name => "file_name", :ext => "mock", :size => 1000}
      end
      
      context "size param isn't set" do
        it "instantiates new Filer class with size nil" do
          Filer::MockFiler.should_receive(:new).with("file_name", nil).and_return(filer)
          get :show, {:name => "file_name", :ext => "mock"}
        end
      end
      
    end
    
    context "when requested file extension doesn't exists" do      
      it "renders error page" do
        expect{get :show, {:name => "file_name", :ext => "wrong_ext", :size => 1000}}.to raise_error
      end      
    end
  end

end