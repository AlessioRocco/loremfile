class FilersController < ApplicationController
  def show
    filer = Filer.const_get("#{params[:ext].to_s.camelize}Filer").new(params[:name], (params[:size] ? params[:size].to_i : nil) )
    send_file(filer.create) 
  end
end