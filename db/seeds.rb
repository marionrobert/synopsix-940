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

Movie.destroy_all

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
file = File.open(Rails.root.join("app/assets/images/categories/all_movies_new.jpg"))
new_category.photo.attach(io: file, filename: "all_movies_new.jpg", content_type: "image/jpeg")

new_category = Category.create!(name: "Blockbuster")
file = File.open(Rails.root.join("app/assets/images/categories/blockbuster_movies_new.jpg"))
new_category.photo.attach(io: file, filename: "blockbuster_movies_new.jpg", content_type: "image/jpeg")

new_category = Category.create!(name: "Action")
file = File.open(Rails.root.join("app/assets/images/categories/action_movies_new.jpg"))
new_category.photo.attach(io: file, filename: "action_movies_new.jpg", content_type: "image/jpeg")

new_category = Category.create!(name: "Drama")
file = File.open(Rails.root.join("app/assets/images/categories/drama_movies_new.jpg"))
new_category.photo.attach(io: file, filename: "drama_movies_new.jpg", content_type: "image/jpeg")

new_category = Category.create!(name: "Comedy")
file = File.open(Rails.root.join("app/assets/images/categories/comedy_movies.jpg"))
new_category.photo.attach(io: file, filename: "comedy_movies.jpg", content_type: "image/jpeg")

new_category = Category.create!(name: "Historical")
file = File.open(Rails.root.join("app/assets/images/categories/historical_movies.jpg"))
new_category.photo.attach(io: file, filename: "historical_movies.jpg", content_type: "image/jpeg")


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

jesica = User.create!(username: "Jesica", email: "jes@gmail.com", password: "123456", description: "USA ROCKS!", admin: true)
file = File.open(Rails.root.join("app/assets/images/avatars/jes.jpg"))
jesica.photo.attach(io: file, filename: "jes.jpg", content_type: "image/jpeg")

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



# Movie.find_by(title: "Forrest Gump").update(category: historical_category)
# Movie.find_by(title: "The Wolf of Wall Street").update(category: comedy_category)


#demo movies

Movie.create( title: "Independence day",
              synopsis: "In this epic adventure film, strange phenomena surface around the globe. The skies ignite. Terror races through the world's major cities. As these extraordinary events unfold, it becomes increasingly clear that an alien force of incredible magnitude has arrived. Its mission: total annihilation over the Fourth of July weekend. The last hope to stop the destruction is an unlikely group of people united by fate and unimaginable circumstances.",
              poster: "https://static.pointculture.be/media/5d/c8/2f/cover_vi4791_scale_345x750.jpg",
              category: "Blockbuster",
              trailer: "https://www.youtube.com/embed/B1E7h3SeMDk?controls=0&amp;start=108;?rel=0&autoplay=1",
              hint_1: "invasion",
              hint_2: "massive destruction",
              hint_3: "alien",
            )

Movie.create( title: "Grease",
              synopsis: "Experience the friendships, romances and adventures of a group of high school kids in the 1950s, with Danny, Sandy, the Pink Ladies, and the Greasers. Welcome to the singing and dancing world of "Grease," the most successful movie musical of all time. A wholesome exchange student Sandy and a leather-clad Danny have a summer romance, but will it cross clique lines?",
              poster: "https://m.media-amazon.com/images/I/61FSpk5jADL._AC_SY606_.jpg",
              category: "Comedy",
              trailer: "https://www.youtube.com/embed/THd96gHV7Tg?controls=0&amp;start=3;?rel=0&autoplay=1",
              hint_1: "musical comedy",
              hint_2: "Sandy",
              hint_3: "You are the one that i want",
            )

Movie.create( title: "Avengers Endgame",
              synopsis: "Adrift in space with no food or water, Tony Stark sends a message to Pepper Potts as his oxygen supply starts to dwindle. Meanwhile, the remaining Avengers -- Thor, Black Widow, Captain America and Bruce Banner -- must figure out a way to bring back their vanquished allies for an epic showdown with Thanos -- the evil demigod who decimated the planet and the universe.",
              poster: "https://lumiere-a.akamaihd.net/v1/images/p_avengersendgame_19751_e14a0104.jpeg?region=0%2C0%2C540%2C810",
              category: "Action",
              trailer: "https://www.youtube.com/embed/TcMBFSGVi1c?controls=0&amp;start=108;?rel=0&autoplay=1",
              hint_1: "teammate",
              hint_2: "superheros",
              hint_3: "2019",
            )

Movie.create( title: "The TRUMAN show",
              synopsis: "He doesn't know it, but everything in Truman Burbank's life is part of a massive TV set. Executive producer Christof orchestrates "The Truman Show," a live broadcast of Truman's every move captured by hidden cameras. Cristof tries to control Truman's mind, even removing his true love, Sylvia, from the show and replacing her with Meryl. As Truman gradually discovers the truth, however, he must decide whether to act on it.",
              poster: "https://m.media-amazon.com/images/I/61XZBVJQ9pL._AC_.jpg",
              category: "Drama",
              trailer: "https://www.youtube.com/embed/dlnmQbPGuls?controls=0&amp;start=93;?rel=0&autoplay=1",
              hint_1: "no escape",
              hint_2: "TV show",
              hint_3: "Jim CARREY",
            )

Movie.create( title: "Titanic",
              synopsis: "An epic, action-packed romance about Jack and Rose, set against the ill-fated maiden voyage of the R.M.S. Titanic; the pride and joy of the White Star Line and, at the time, the largest moving object ever built. She was the most luxurious liner of her era -- the "ship of dreams" -- which ultimately carried over 1,500 people to their death in the ice cold waters of the North Atlantic after sinking in the early hours of April 15, 1912.",
              poster: "https://m.media-amazon.com/images/I/91J0KtuFMAL._AC_SY606_.jpg",
              category: "All",
              trailer: "https://www.youtube.com/embed/ZQ6klONCq4s?controls=0&amp;start=29;?rel=0&autoplay=1",
              hint_1: "High sea",
              hint_2: "Liverpool",
              hint_3: "Iceberg",
            )

Movie.create( title: "Saving Private Ryan",
              synopsis: "Captain John Miller takes his men behind enemy lines to find Private James Ryan, whose three brothers have been killed in combat. Surrounded by the brutal realties of war, while searching for Ryan, each man embarks upon a personal journey and discovers their own strength to triumph over an uncertain future with honor, decency and courage.",
              poster: "https://m.media-amazon.com/images/I/41zN6HGkL1L._AC_.jpg",
              category: "Historical",
              trailer: "https://www.youtube.com/embed/9CiW_DgxCnQ?controls=0&amp;start=65;?rel=0&autoplay=1",
              hint_1: "World War II",
              hint_2: "rescue",
              hint_3: "MILLER",
            )
