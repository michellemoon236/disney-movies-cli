class CLI 
  
  def run 
    puts ""
    puts "Welcome to Disney Movies!".colorize(:light_blue)
    puts "Here is a list of Disney's best animated movies:".colorize(:light_blue)
    Scraper.scrape_movie_list
    print_movie_list
    input = ""
    while input != "exit" do
      puts "---------------------------------------------------------".colorize(:light_blue)
      puts "MENU".colorize(:light_blue)
      puts "To see details of a movie, enter the number of the movie."
      puts "To see the movie list again, enter 'list'."
      puts "To exit the program, enter 'exit'."
      puts "---------------------------------------------------------".colorize(:light_blue)
      
      input = gets.strip.downcase
      
      if (1..50).include?(input.to_i)
        single_movie = Movie.alphabetized_list[input.to_i-1]
        Scraper.scrape_single_movie(single_movie) if !single_movie.runtime
        print_single_movie(single_movie)
      elsif input == "list"
        print_movie_list
      elsif input != "exit"
        puts "I'm sorry I didn't recognize that option. Please enter a valid option from the menu."
      end
    end
    puts "Goodbye!"
  end
  
  def print_movie_list
    puts "---------------------------------------------------------".colorize(:light_blue)
    Movie.alphabetized_list.each.with_index(1) do |movie, index|
      puts "#{index}. #{movie.name}"
    end
  end
  
  def print_single_movie(movie)
    puts "---------------------------------------------------------".colorize(:light_blue)
    puts ""
    puts "#{movie.name.upcase}".colorize(:light_blue)
    puts ""
    puts "Description:"
    puts "#{movie.description}"
    puts ""
    puts "Release Date: #{movie.release_date}"
    puts ""
    puts "Runtime: #{movie.runtime}"
    puts ""
    puts "Director(s): #{movie.director}"
    puts ""
    puts "Writer(s): #{movie.writer}"
    puts ""
  end 
  
end
