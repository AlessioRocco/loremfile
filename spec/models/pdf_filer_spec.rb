require 'spec_helper'

describe PdfFiler do
  
  let(:pdf_filer){ PdfFiler.new "file_name", {} }
  
  describe ".new" do
    it "assign name parameter to name instance variable" do      
      expect(pdf_filer.file_name).to eq("file_name")      
    end
  end
  
  describe "#create" do
    it "generate a pdf file" do
      pdf_filer.create
      expect(File.magic_number_type("#{Rails.root}/tmp/#{pdf_filer.file_name}.pdf")).to eq(:pdf)
    end
    it "return file path" do
      expect(pdf_filer.create).to eq("#{Rails.root}/tmp/#{pdf_filer.file_name}.pdf")
    end
  end

end