require "filer/base"
class PdfFiler < Filer::Base

  def create
    Prawn::Document.generate(file_path)
    file_path
  end

  private

  def file_path
    "#{Rails.root}/tmp/#{name}.pdf"
  end
end
