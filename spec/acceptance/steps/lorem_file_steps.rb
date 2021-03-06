module LoremFileSteps
  step "I go to :url" do |url|
    visit url
  end
  
  step "I should get a file named :file_name and of :ext mime-type" do |file_name, ext|
    page.response_headers['Content-Type'].should == "application/#{ext}"
    page.response_headers['Content-Disposition'].should =~ /attachment; filename=.*#{file_name}.*/
  end
end