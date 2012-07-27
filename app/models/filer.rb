class Filer
  
  attr_reader :file_creator
  
  delegate :create, :to => :file_creator
  
  def initialize(name, ext, params = {})
    @file_creator = Kernel.const_get("#{ext.to_s.camelize}Filer").new name.to_s, params
  end

  # attr_accessor :name, :ext
  # 
  # def initialize(name, ext)
  #   self.name = name
  #   self.ext = ext
  # end
  # 
  # def create_file
  #   File.new("#{Rails.root}/tmp/#{name}.#{ext}", "w+")
  #   "#{Rails.root}/tmp/#{name}.#{ext}"
  # end
  
end