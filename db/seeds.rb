require 'json'

# moviesarray =  [
#   "tt13314558/",
#   "tt11866324/",
#   "tt12593682/",
#   "tt10954984/",
#   "tt1745960/",
#   "tt9764362/",
#   "tt3704428/",
#   "tt12262116/",
#   "tt1649418/",
#   "tt11851548/",
#   "tt4614584/",
#   "tt7144666/",
#   "tt14298328/",
#   "tt0077631/",
#   "tt13223398/",
#   "tt10648342/",
#   "tt8110652/",
#   "tt11976532/",
#   "tt1464335/",
#   "tt14001894/",
#   "tt10028196/",
#   "tt10298810/",
#   "tt15325794/",
#   "tt0092099/",
#   "tt9411972/",
#   "tt6710474/",
#   "tt8041270/",
#   "tt13560574/",
#   "tt7214954/",
#   "tt11271038/",
#   "tt10886166/",
#   "tt13320622/",
#   "tt14614892/",
#   "tt8912936/",
#   "tt0093773/",
#   "tt1877830/",
#   "tt11138512/",
#   "tt1148204/",
#   "tt0068646/",
#   "tt0120828/",
#   "tt9419884/",
#   "tt3829266/",
#   "tt5113044/",
#   "tt21106646/",
#   "tt10872600/",
#   "tt3799694/",
#   "tt12724306/",
#   "tt0104694/",
#   "tt10168670/",
#   "tt13664684/",
#   "tt9731386/",
#   "tt10268488/",
#   "tt8178634/",
#   "tt14596320/",
#   "tt14502344/",
#   "tt21237030/",
#   "tt6467266/",
#   "tt9198364/",
#   "tt5500218/",
#   "tt0111161/",
#   "tt10731256/",
#   "tt7131622/",
#   "tt12873562/",
#   "tt15255876/",
#   "tt5052448/",
#   "tt1160419/",
#   "tt1517268/",
#   "tt14814040/",
#   "tt1424381/",
#   "tt1630029/",
#   "tt5834426/",
#   "tt12996154/",
#   "tt15978956/",
#   "tt21340300/",
#   "tt11214590/",
#   "tt1655441/",
#   "tt1833116/",
#   "tt0100403/",
#   "tt11426572/",
#   "tt4513678/",
#   "tt7657566/",
#   "tt0109830/",
#   "tt0110912/",
#   "tt0120737/",
#   "tt0116483/",
#   "tt0816692/",
#   "tt11291274/",
#   "tt0083929/",
#   "tt13698942/",
#   "tt0113277/",
#   "tt8772262/",
#   "tt9288046/",
#   "tt2980592/",
#   "tt12477480/",
#   "tt0119081/",
#   "tt12789558/",
#   "tt13660916/",
#   "tt0993846/",
#   "tt4123432/",
#   "tt14549466/"
# ]

# Movie.destroy_all

# Category.create(name: "default")


# moviesarray.each do |movie|
#   sleep(1)  # API BLOCKED TOO MUCH REQUEST PER SECOND
#     url = URI("https://online-movie-database.p.rapidapi.com/title/get-plots?tconst=#{movie}")


#   http = Net::HTTP.new(url.host, url.port)
#   http.use_ssl = true
#   http.verify_mode = OpenSSL::SSL::VERIFY_NONE

#   request = Net::HTTP::Get.new(url)
#   request["X-RapidAPI-Key"] = '53db1e7db8msh637a665b48e0679p10a88djsn58cb9ab8e37e'
#   request["X-RapidAPI-Host"] = 'online-movie-database.p.rapidapi.com'

#   response = http.request(request)
#   data = response.read_body   #WE GET ALL ABOUT ONE MOVIE

#   plot_array = JSON.parse(data)["plots"].map do |plot|      # WE PARSE TO ISOLATE EACH DATA
#                plot["text"]
#   end

#   plot_length = plot_array.sort_by do |plot|       # WE SORT BY LENGTH EVERY PLOTS
#                 plot.length
#   end

#   plot = plot_length.last   # WE CHOOSE THE LONGER ONE SO...THE LAST ONE
#   poster_url = JSON.parse(data)["base"]["image"]["url"]  # WE GET THE POSTER
#   movie_title = JSON.parse(data)["base"]["title"] # WE GET THE MOVIE TITLE

# if plot.length > 400  # A VOIR LA LONGUEUR SOUHAITE
# Movie.create!(synopsis: plot, poster: poster_url, title: movie_title, category: Category.all.sample)
# # WE BUILD THE DB WITH THE SEED
# end


# end


#Movie.create!(title: "Titanic", synopsis:"Deep-sea explorer Brock Lovett has reached the most famous shipwreck of all - the Titanic. Emerging with a safe believed to contain a diamond called 'The Heart of the Ocean', he discovers the safe does not hold the diamond but a drawing of a beautiful woman wearing it. When Brock is later interviewed on TV, he shows the drawing to the cameras, and a 100-year-old woman named Rose Calvert living in Michigan recognizes the woman in the drawing - herself! On a visit to Brock's explorer ship over the wreck, Rose tells her story of the Titanic and its ill-fated voyage. Engaged to a would-be steel magnate, Caledon Hockley, she boards the Titanic's first-class suites with him and her mother in Southampton. Also boarding are Jack Dawson and his best friend Fabrizio De Rossi, after a lucky poker game wins them tickets in steerage. When Rose attempts suicide by jumping off the stern in third-class, Jack pulls her back onto the ship... and a bond is forged between them as Jack is invited by her into first-class the following day. Rose's mother and Caledon Hockley try desperate measures to keep them apart. But that strategy goes out the window when the Titanic collides with an iceberg, and due to a design flaw begins to sink - despite being proclaimed 'unsinkable'. Now Rose and Jack must fight to stay alive, but is young Jack already doomed because of his lower status as a steerage passenger?",
#poster: "https://i.f1g.fr/media/figaro/orig/2017/01/02/XVM6b8cdc20-d115-11e6-8bd8-580394ba5090.jpg",category: Category.last)



Input.destroy_all
PlayerGame.destroy_all
Game.destroy_all
User.destroy_all
Movie.destroy_all
Category.destroy_all



#CATEGORIES CREATION
new_category = Category.create!(name: "All")
file = File.open(Rails.root.join("app/assets/images/categories/all_movies.jpg"))
new_category.photo.attach(io: file, filename: "all_movies.jpg", content_type: "image/jpeg")

new_category = Category.create!(name: "Blockbuster")
file = File.open(Rails.root.join("app/assets/images/categories/blockbuster_movies.jpg"))
new_category.photo.attach(io: file, filename: "blockbuster_movies.jpg", content_type: "image/jpeg")

new_category = Category.create!(name: "Action")
file = File.open(Rails.root.join("app/assets/images/categories/action_movies.jpg"))
new_category.photo.attach(io: file, filename: "action_movies.jpg", content_type: "image/jpeg")

new_category = Category.create!(name: "Drama")
file = File.open(Rails.root.join("app/assets/images/categories/drama_movies.jpg"))
new_category.photo.attach(io: file, filename: "drama_movies.jpg", content_type: "image/jpeg")


p "📁 Categories created"

  file = File.read(Rails.root.join('public/data_movies.json'))
  data_hash = JSON.parse(file)

#USERS CREATION

thomas = User.create(username: "Thomas", email: "tho@gmail.com", password: "123456", description: "crazy rocker", admin: true)
file = File.open(Rails.root.join("app/assets/images/avatars/thomas.jpg"))
thomas.photo.attach(io: file, filename: "thomas.jpg", content_type: "image/jpeg")

marion = User.create!(username: "Marion", email: "mar@gmail.com", password: "123456", description: "diamond rocker", admin: true)
file = File.open(Rails.root.join("app/assets/images/avatars/marion.jpg"))
marion.photo.attach(io: file, filename: "marion.jpg", content_type: "image/jpeg")

jessica = User.create!(username: "Jessica", email: "jes@gmail.com", password: "123456", description: "USA ROCKS!", admin: true)
file = File.open(Rails.root.join("app/assets/images/avatars/jes.jpg"))
jessica.photo.attach(io: file, filename: "jes.jpg", content_type: "image/jpeg")

aurelien = User.create!(username: "Aurelien", email: "aur@gmail.com", password: "123456", description: "the one who does not know how to play anything", admin: true)
file = File.open(Rails.root.join("app/assets/images/avatars/aurelien.jpg"))
aurelien.photo.attach(io: file, filename: "aurelien.jpg", content_type: "image/jpeg")


  p "👤Users created"




#MOVIES CREATION
#Reading from JSON file
#TODO Replace category
data_hash.each_value do |movie|
  Movie.create( title: movie["title"],
                synopsis: movie["synopsis"],
                poster: movie["poster"],
                category: Category.all.sample)

  p "🎥 Movie #{movie["title"]} created"
end

comedy_category = Category.create!(name: "Comedy")
file = File.open(Rails.root.join("app/assets/images/categories/comedy_movies.jpg"))
comedy_category.photo.attach(io: file, filename: "comedy_movies.jpg", content_type: "image/jpeg")

historical_category = Category.create!(name: "Historical")
file = File.open(Rails.root.join("app/assets/images/categories/historical_movies.jpg"))
historical_category.photo.attach(io: file, filename: "historical_movies.jpg", content_type: "image/jpeg")


Movie.find_by(title: "Forrest Gump").update(category: historical_category)
Movie.find_by(title: "The Wolf of Wall Street").update(category: comedy_category)
