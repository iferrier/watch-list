require 'faker'
require 'uri'
require 'json'

puts "Cleaning database"
Movie.destroy_all

url = "https://tmdb.lewagon.com/movie/top_rated"
base_url_film_path = "https://image.tmdb.org/t/p/w500"
film_serialized = URI.open(url).read
list = JSON.parse(film_serialized)

film_list = list['results']

puts "Creating films from the API"
film_list.each do |element|
  title = element['original_title']
  overview = element['overview']
  poster_url = base_url_film_path + element['poster_path']
  movie = Movie.new(
    title: title,
    overview: overview,
    poster_url: poster_url,
    rating: rand(1.0..10.00).truncate(1)
  )
  file = URI.open("https://res.cloudinary.com/dteopaixi/image/upload/v1677432296/development/3jif61tdx4qtl694audyh3v6lytf.jpg")
  movie.photo.attach(io: file, filename: "name", content_type: "image/jpg")
  movie.save
end

puts "Done"

# puts "Creating films from seeds"
# Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
# Movie.create(title: Faker::Movie.title, overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
# puts "Done"
