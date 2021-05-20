require 'open-uri'
require 'json'

url = 'http://tmdb.lewagon.com/discover/movie?sort_by=vote_average.desc&vote_count.gte=3000'

response = open(url).read
movies = JSON.parse(response)["results"]

movies.each do |movie|
  poster_url = "https://image.tmdb.org/t/p/w500#{movie['poster_path']}"
  Movie.create(title: movie['title'],
               overview: movie['overview'],
               poster_url: poster_url,
               rating: movie['vote_average'].to_f)
end
