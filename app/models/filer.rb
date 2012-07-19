class Filer
  
  attr_accessor :name, :ext
  
  def initialize(name, ext)
    self.name = name
    self.ext = ext
  end
  
  def create_file
    File.new("#{Rails.root}/tmp/#{name}.#{ext}", "w+")
    "#{Rails.root}/tmp/#{name}.#{ext}"
  end
  
end