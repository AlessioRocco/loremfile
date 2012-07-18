require 'spec_helper'
describe FilersController do
  describe "download file" do
    context "when a file is requested" do
      
      let(:file_name){"file_name"}
      let(:file_ext){"file_ext"}
      let(:complete_file_name){"#{file_ext}.#{file_ext}"}
      
      before(:each) do        
        @filer = mock(Filer)
        Filer.stub(:new).and_return(@filer)
        File.open("#{Rails.root}/tmp/#{complete_file_name}", "w")
        @filer.stub(:created_file).and_return("#{Rails.root}/tmp/#{complete_file_name}")
      end
      
      after(:each) do
        get :show, {:name => file_name, :ext => file_ext}
      end
      
      it "should create new Filer" do
        Filer.should_receive(:new).with(file_name, file_ext).and_return(@filer)               
      end
      
      it "should responde with a file" do
        @filer.should_receive(:created_file)
        controller.should_receive(:send_file).and_return{controller.render :nothing => true}
      end
    end
  end
end