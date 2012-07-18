require 'spec_helper'
describe FilersController do
  describe "download file" do
    context "when a pdf file is requested" do
      
      let(:filer) { Filer.new("nome", "ext") }
      
      it "should create new Filer" do
        Filer.should_receive(:new).with(kind_of(String), kind_of(String))
        Filer.stub(:created_file).and_return("name.ext")
        get :show, {:name => "file_name", :ext => "pdf"}
      end
      
      it "should responde with a pdf file" do
        Filer.any_instance.stub(:created_file).and_return("name.ext")
        filer.should_receive(:created_file)
        controller.stub(:send_file)
        controller.should_receive(:send_file)
        get :show, {:name => "file_name", :ext => "pdf"}
      end
    end
  end
end