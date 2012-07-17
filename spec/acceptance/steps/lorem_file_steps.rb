module LoremFileSteps
  step "I go to :url" do |url|
    visit url
  end
  
  step "I should get a file named :file_name and of :ext type" do |file_name, ext|
    result = page.response_headers['Content-Type'].should == "application/octet-stream"
    if result
      result = page.response_headers['Content-Disposition'].should =~ /#{file_name}.#{ext}/
    end
    result
  end
end