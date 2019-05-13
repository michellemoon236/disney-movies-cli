class Scraper
  
  def self.scrape_movie_list
    doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/guides/best_disney_animated_movies/#"))
    
    doc.css("div.rank_item_row div.details").each do |i|
      movie = Movie.new 
      movie.name = i.css("h3 a")[0].text.gsub(/\s[(]\d\d\d\d[)]/,"").strip
      movie.url = i.css("h3 a")[0].attribute("href").value
    end
  end
  
  
  def self.scrape_single_movie(movie)
    doc = Nokogiri::HTML(open("https://www.rottentomatoes.com#{movie.url}"))
    
    movie.release_date = doc.css("ul.content-meta time")[0].text.strip
    movie.runtime = doc.css("ul.content-meta time")[2].text.strip
    movie.director = doc.css("ul.content-meta li.meta-row")[2].css("div.meta-value a").collect { |i| i.text}.join(", ")
    movie.writer = doc.css("ul.content-meta li.meta-row")[3].css("div.meta-value a").collect { |i| i.text}.join(", ")
    movie.description = doc.css("div#movieSynopsis")[0].text.strip
  end
  
end