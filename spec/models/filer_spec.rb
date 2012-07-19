require 'spec_helper'
describe Filer do  
  before(:each) do
    @file_name = "file_name"
    @file_ext = "file_ext"
    @filer = Filer.new @file_name, @file_ext 
  end
  
  describe "#new" do
    it "set name instance variable" do
      @filer.name.should eq(@file_name) 
    end
    
    it "set ext instance variable" do
      @filer.ext.should eq(@file_ext)
    end
  end
  
  describe "#create_file" do
    it "generate a file with name and extension from name and ext" do
      @filer.create_file
      File.exists?("#{Rails.root}/tmp/#{@file_name}.#{@file_ext}").should eq(true)
    end
    
    it "return the generated file path" do
      @filer.create_file.should eq("#{Rails.root}/tmp/#{@file_name}.#{@file_ext}")
    end
  end
  
end