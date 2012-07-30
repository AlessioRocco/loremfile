class PdfFiler
  
  attr_reader :file_name
  attr_reader :options
  
  def initialize name, *args
    @file_name = name
    @options = args.extract_options!
  end
  
  def create
    Prawn::Document.generate(file_path)
    file_path
  end
  
  private
  
  def file_path
    "#{Rails.root}/tmp/#{file_name}.pdf"
  end
end