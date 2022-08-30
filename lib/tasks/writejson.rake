namespace :writejson do

  task run: [:environment] do

    movies = {}
    File.open(Rails.root.join("public/data_movies.json"), "w") do |file|
      Movie.all.each  do |m|
        movies[m.title] = {
          title: m.title,
          synopsis: m.synopsis,
          poster: m.poster
        }
      end
      file.write(movies.to_json)
    end
  end
end
