shared_examples "a filer" do  
  
  it "is instance of filer" do
    expect(filer).to be_a(Filer::Base)
  end
  
  describe ".new" do
          
    it "assigns name parameter to name instance variable" do
      expect(filer.name).to eq("file_name")
    end
  
    context "with size" do          
      it "assigns size parameter to size instance variable" do
        expect(filer_with_size.size).to eq(1000)
      end
    end
  
    context "without size" do
      it "assigns nil to size instance variable" do
        expect(filer.size).to eq(nil)
      end
    end

  end

  describe "#create" do
    it "generate a file" do
      filer.create
      expect(File.magic_number_type("#{Rails.root}/tmp/#{filer.name}.#{file_type.to_s}")).to eq(file_type.to_sym)
    end
    it "return file path" do
      expect(filer.create).to eq("#{Rails.root}/tmp/#{filer.name}.#{file_type.to_s}")
    end
  end
end