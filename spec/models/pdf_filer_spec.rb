require 'spec_helper'

describe PdfFiler do
    
  describe ".new" do
    context "without optional args" do
      let(:pdf_filer){ PdfFiler.new "file_name", {} }
      
      it "assigns name parameter to name instance variable" do
        expect(pdf_filer.file_name).to eq("file_name")
      end
    end
    
    context "with optional args" do
      let(:pdf_filer){ PdfFiler.new "file_name", { :size => 500 } }
      
      it "assigns name parameter to name instance variable" do
        expect(pdf_filer.file_name).to eq("file_name")
      end
            
      it "assigns optional args" do
        expect(pdf_filer.options[:size]).to eq(500)
      end
    end
  end
  
  describe "#create" do
    let(:pdf_filer){ PdfFiler.new "file_name", {} }
    
    it "generate a pdf file" do
      pdf_filer.create
      expect(File.magic_number_type("#{Rails.root}/tmp/#{pdf_filer.file_name}.pdf")).to eq(:pdf)
    end
    it "return file path" do
      expect(pdf_filer.create).to eq("#{Rails.root}/tmp/#{pdf_filer.file_name}.pdf")
    end
  end

end