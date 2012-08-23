require 'spec_helper'

describe PdfFiler do

  let(:filer){ PdfFiler.new "file_name" }
  let(:filer_with_size){ PdfFiler.new "file_name", 1000 }
  let(:file_type){ "pdf" }
  
  it_behaves_like "a filer"

end
