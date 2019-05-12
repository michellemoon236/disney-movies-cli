class CLI 
  
  def run 
    puts "Welcome to Disney Animated Movies!"
    #Scraper.scrape_movie_list
    Scraper.scrape_single_movie("/m/1019187-sleeping_beauty")
    #print_movies
    #binding.pry 
  end
  
  def print_movies
    alphabetized_list = Movie.all.sort_by { |movie| movie.name }
    alphabetized_list.each.with_index(1) do |movie, index|
      puts "#{index}. #{movie.name}"
    end
  end
  
end
