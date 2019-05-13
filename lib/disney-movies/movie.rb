class Movie
  
  attr_accessor :name, :url, :release_date, :runtime, :director, :writer, :description
  
  @@all = []
  
  def initialize
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.alphabetized_list
    @@all.each.sort_by { |movie| movie.name}
  end
  
end