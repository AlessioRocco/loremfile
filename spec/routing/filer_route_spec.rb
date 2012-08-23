require 'spec_helper'
describe "filer routes" do
  
  it "routes /file.ext to filer#show" do
    expect(:get => "/file.ext").to route_to( :controller => "filers", :action => "show", :name => "file", :ext => "ext")
  end
  
  it "routes /file.ext/1000 to filer#show" do
    expect(:get => "/file.ext/1000").to route_to( :controller => "filers", :action => "show", :name => "file", :ext => "ext", :size => "1000")
  end
  
  it "routes /file.ext/WRONGSIZE to filer#show" do
    expect(:get => "/file.ext/WRONGSIZE").not_to be_routable 
  end
  
end