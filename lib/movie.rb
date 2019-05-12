class Movie
  
  attr_accessor :name, :url, :release_date, :runtime, :directors, :writers, :description
  
  @@all = []
  
  def initialize
    @@all << self
  end
  
  def self.all
    @@all
  end
  
end