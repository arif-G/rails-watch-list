require 'open-uri'
require 'json'

url = 'http://tmdb.lewagon.com/discover/movie?sort_by=vote_average.desc&vote_count.gte=3000'

List.destroy_all
Bookmark.destroy_all
Movie.destroy_all

response = open(url).read
movies = JSON.parse(response)["results"]

movies.each do |movie|
  poster_url = "https://image.tmdb.org/t/p/w500#{movie['backdrop_path']}"
  Movie.create(title: movie['title'],
               overview: movie['overview'],
               poster_url: poster_url,
               rating: movie['vote_average'].to_f)
end

demo_list = List.create(name: 'demo')

all_movies = Movie.all

all_movies.sample(5).each do |movie|
  bookmark = Bookmark.new(movie: movie, list: demo_list, comment: 'demo comment')
  p bookmark
  bookmark.save
end
