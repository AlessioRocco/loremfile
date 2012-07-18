class FilersController < ApplicationController
  def show
    @filer = Filer.new(params[:name],params[:ext])
    #send_file(@filer.created_file)
  end
end