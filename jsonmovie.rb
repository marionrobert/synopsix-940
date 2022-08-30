require 'json'


movies = {}
File.open(Rails.root.join("public/data_movies.json")) do |file|
  Movies.all.each  do |m|
    movies[m.title] = {
      title: m.title,
      synopsis: m.synopsis,
      poster: m.poster
    }
  end

  file.write(movies)
end
