require 'spec_helper'
describe FilersController do
  
  describe "GET #show" do
    
    let(:filer){mock(Filer).as_null_object}
    
    before do
      Filer.stub(:new).and_return(filer)
      File.open("#{Rails.root}/tmp/test_file", "w")
      filer.stub(:create).and_return("#{Rails.root}/tmp/test_file")
    end
    
    it "doesn't render nothing" do
      response.body.should be_blank
    end
    
    context "with arbitrary params" do
      
      context "with odd params" do
        it "it generate an exception" do          
          expect{get :show, {:name => "file_name", :ext => "file_ext", :args => "size/100/text"}}.to raise_error
        end
      end
      
      context "without odd params" do
        it "creates a new Filer" do
          Filer.should_receive(:new).with("file_name", "file_ext", { "size" => "100", "text" => "MyText"})
          get :show, {:name => "file_name", :ext => "file_ext", :args => "size/100/text/MyText"}
        end
      end
    end
    
    context "without arbitrary params" do
      it "creates a new Filer" do
        Filer.should_receive(:new).with("file_name", "file_ext", {})
        get :show, {:name => "file_name", :ext => "file_ext"}
      end
    end
    
    it "creates the file" do
      filer.should_receive(:create)
      get :show, {:name => "file_name", :ext => "file_ext"}
    end
      
    it "returns requested file" do
      controller.should_receive(:send_file).and_return{controller.render :nothing => true}
      get :show, {:name => "file_name", :ext => "file_ext"}
    end
  end

end