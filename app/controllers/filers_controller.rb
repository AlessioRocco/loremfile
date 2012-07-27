class FilersController < ApplicationController
  def show    
    filer = Filer.new(params[:name], params[:ext], args)
    send_file(filer.create)    
  end
  
  private
  
  def args
    params[:args] ? Hash[*params[:args].split("/")] : {}
  end
end