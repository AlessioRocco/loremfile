class PdfFiler
  
  attr_reader :file_name
  
  def initialize name, args
    @file_name = name
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