module Filer
  class Base

    attr_reader :name, :size

    def initialize name, size = nil
      @name = name
      @size = size
    end 
  
  end
end