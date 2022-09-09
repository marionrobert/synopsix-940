require 'json'


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
# data_hash.each_value do |movie|
#   Movie.create( title: movie["title"],
#                 synopsis: movie["synopsis"],
#                 poster: movie["poster"],
#                 category: Category.all.sample)

#   p "🎥 Movie #{movie["title"]} created"
# end



# Movie.find_by(title: "Forrest Gump").update(category: historical_category)
# Movie.find_by(title: "The Wolf of Wall Street").update(category: comedy_category)


#demo movies

Movie.create( title: "Independence Day",
              synopsis: "In this epic adventure film, strange phenomena surface around the globe. The skies ignite. Terror races through the world's major cities. As these extraordinary events unfold, it becomes increasingly clear that an alien force of incredible magnitude has arrived. Its mission: total annihilation over the Fourth of July weekend. The last hope to stop the destruction is an unlikely group of people united by fate and unimaginable circumstances.",
              poster: "https://static.pointculture.be/media/5d/c8/2f/cover_vi4791_scale_345x750.jpg",
              category: Category.find_by(name: "Blockbuster"),
              trailer: "https://www.youtube.com/embed/B1E7h3SeMDk?controls=0&amp;start=108;?rel=0&autoplay=1",
              hint_1: "invasion",
              hint_2: "massive destruction",
              hint_3: "alien",
            )

Movie.create( title: "Grease",
              synopsis: "Experience the friendships, romances and adventures of a group of high school kids in the 1950s, with Danny, Sandy, the Pink Ladies, and the Greasers. Welcome to the singing and dancing world of 'Grease' the most successful movie musical of all time. A wholesome exchange student Sandy and a leather-clad Danny have a summer romance, but will it cross clique lines?",
              poster: "https://m.media-amazon.com/images/I/61FSpk5jADL._AC_SY606_.jpg",
              category: Category.find_by(name: "Comedy"),
              trailer: "https://www.youtube.com/embed/THd96gHV7Tg?controls=0&amp;start=3;?rel=0&autoplay=1",
              hint_1: "musical comedy",
              hint_2: "Sandy",
              hint_3: "You are the one that i want",
            )

Movie.create( title: "Avengers Endgame",
              synopsis: "Adrift in space with no food or water, Tony Stark sends a message to Pepper Potts as his oxygen supply starts to dwindle. Meanwhile, the remaining Avengers -- Thor, Black Widow, Captain America and Bruce Banner -- must figure out a way to bring back their vanquished allies for an epic showdown with Thanos -- the evil demigod who decimated the planet and the universe.",
              poster: "https://lumiere-a.akamaihd.net/v1/images/p_avengersendgame_19751_e14a0104.jpeg?region=0%2C0%2C540%2C810",
              category: Category.find_by(name: "Action"),
              trailer: "https://www.youtube.com/embed/TcMBFSGVi1c?controls=0&amp;start=108;?rel=0&autoplay=1",
              hint_1: "teammate",
              hint_2: "superheros",
              hint_3: "2019",
            )

Movie.create( title: "The Truman Show",
              synopsis: "He doesn't know it, but everything in Truman Burbank's life is part of a massive TV set. Executive producer Christof orchestrates 'The Truman Show,' a live broadcast of Truman's every move captured by hidden cameras. Cristof tries to control Truman's mind, even removing his true love, Sylvia, from the show and replacing her with Meryl. As Truman gradually discovers the truth, however, he must decide whether to act on it.",
              poster: "https://m.media-amazon.com/images/I/61XZBVJQ9pL._AC_.jpg",
              category: Category.find_by(name: "Drama"),
              trailer: "https://www.youtube.com/embed/dlnmQbPGuls?controls=0&amp;start=93;?rel=0&autoplay=1",
              hint_1: "no escape",
              hint_2: "TV show",
              hint_3: "Jim CARREY",
            )

Movie.create( title: "Titanic",
              synopsis: "An epic, action-packed romance about Jack and Rose, set against the ill-fated maiden voyage of the R.M.S. Titanic; the pride and joy of the White Star Line and, at the time, the largest moving object ever built. She was the most luxurious liner of her era -- the 'ship of dreams' -- which ultimately carried over 1,500 people to their death in the ice cold waters of the North Atlantic after sinking in the early hours of April 15, 1912.",
              poster: "https://m.media-amazon.com/images/I/91J0KtuFMAL._AC_SY606_.jpg",
              category: Category.find_by(name: "All"),
              trailer: "https://www.youtube.com/embed/ZQ6klONCq4s?controls=0&amp;start=29;?rel=0&autoplay=1",
              hint_1: "High sea",
              hint_2: "Liverpool",
              hint_3: "Iceberg",
            )

Movie.create( title: "Saving Private Ryan",
              synopsis: "Captain John Miller takes his men behind enemy lines to find Private James Ryan, whose three brothers have been killed in combat. Surrounded by the brutal realties of war, while searching for Ryan, each man embarks upon a personal journey and discovers their own strength to triumph over an uncertain future with honor, decency and courage.",
              poster: "https://m.media-amazon.com/images/I/41zN6HGkL1L._AC_.jpg",
              category: Category.find_by(name: "Historical"),
              trailer: "https://www.youtube.com/embed/9CiW_DgxCnQ?controls=0&amp;start=65;?rel=0&autoplay=1",
              hint_1: "World War II",
              hint_2: "rescue",
              hint_3: "MILLER",
            )

Movie.create( title: "Million dollar baby",
              synopsis: "Wanting to learn from the best, aspiring boxer Maggie Fitzgerald wants Frankie Dunn to train her. At the outset, he flatly refuses saying he has no interest in training a girl. Maggie's rough around the edges, but shows a lot of grit in the ring and he eventually relents. Maggie not only proves to be the boxer he always dreamed of having under his wing, but a friend who fills the great void he's had in his life. Maggie's career skyrockets, but an accident in the ring leads her to ask Frankie for one last favor",
              poster: "https://m.media-amazon.com/images/I/41WOxZw6MWL._AC_.jpg",
              category: Category.find_by(name: "Drama"),
              trailer:"https://www.youtube.com/embed/5_RsHRmIRBY?controls=0&amp;start=14;?rel=0&autoplay=1",
              hint_1: "woman",
              hint_2: "challenge",
              hint_3: "boxe",
            )

Movie.create( title: "Up",
              synopsis: "Carl Fredricksen, a 78-year-old balloon salesman, has lost his wife Ellie and refuses to sell his house. Instead, tying thousands of balloons to his house, he flies away to the South American wilderness. But curmudgeonly Carl's worst nightmare comes true when he discovers a little boy named Russell and a talking dog are stowaways aboard the balloon-powered house.",
              poster: "https://m.media-amazon.com/images/I/71VU4xCX9GL._AC_SY741_.jpg",
              category: Category.find_by(name: "Comedy"),
              trailer: "https://www.youtube.com/embed/ORFWdXl_zJ4?controls=0&amp;start=7;?rel=0&autoplay=1",
              hint_1: "old man",
              hint_2: "inflatable balloon",
              hint_3: "Pixar",
            )

Movie.create( title: "Toy story",
              synopsis: "Woody, a good-hearted cowboy doll who belongs to a young boy named Andy, sees his position as Andy's favorite toy jeopardized when his parents buy him a Buzz Lightyear action figure. Even worse, the arrogant Buzz thinks he's a real spaceman on a mission to return to his home planet. When Andy's family moves to a new house, Woody and Buzz must escape the clutches of maladjusted neighbor Sid Phillips and reunite with their boy.",
              poster: "https://m.media-amazon.com/images/I/51K8r9COEQL._AC_SY450_.jpg",
              category: Category.find_by(name: "Comedy"),
              trailer: "https://www.youtube.com/embed/rNk1Wi8SvNc?controls=0&amp;start=27;?rel=0&autoplay=1",
              hint_1: "animation movie",
              hint_2: "1995",
              hint_3: "Mr POTATO",
            )

Movie.create( title: "Avatar",
              synopsis: "On the lush alien world of Pandora live the Na'vi, beings who appear primitive but are highly evolved. Because the planet's environment is poisonous, human/Na'vi hybrids, called Avatars, must link to human minds to allow for free movement on Pandora. Jake Sully, a paralyzed former Marine, becomes mobile again through one such Avatar and falls in love with a Na'vi woman. As a bond with her grows, he is drawn into a battle for the survival of her world.",
              poster: "https://m.media-amazon.com/images/I/81D1F9g+x0L._AC_SY606_.jpg",
              category: Category.find_by(name: "Action"),
              trailer: "https://www.youtube.com/embed/5PSNL1qE6VY?controls=0&amp;start=9;?rel=0&autoplay=1",
              hint_1: "navy",
              hint_2: "Blue",
              hint_3: "Jake SULLY",
            )

Movie.create( title: "Edge of tomorrow",
              synopsis: "When Earth falls under attack from invincible aliens, no military unit in the world is able to beat them. Maj. William Cage, an officer who has never seen combat, is assigned to a suicide mission. Killed within moments, Cage finds himself thrown into a time loop, in which he relives the same brutal fight -- and his death -- over and over again. However, Cage's fighting skills improve with each encore, bringing him and a comrade ever closer to defeating the aliens.",
              poster: "https://i.pinimg.com/originals/fa/3b/a2/fa3ba23bdbf1ca1e96456f189d2e495f.jpg",
              category: Category.find_by(name: "Action"),
              trailer: "https://www.youtube.com/embed/vw61gCe2oqI?controls=0&amp;start=5;?rel=0&autoplay=1",
              hint_1: "live",
              hint_2: "die",
              hint_3: "restart",
            )

Movie.create( title: "Pretty woman",
              synopsis: " In this modern update on Cinderella, a prostitute and a wealthy businessman fall hard for one another, forming an unlikely pair. While on a business trip in L.A., Edward, who makes a living buying and breaking up companies, picks up a hooker, Vivian, on a lark. After Edward hires Vivian to stay with him for the weekend, the two get closer, only to discover there are significant hurdles to overcome as they try to bridge the gap between their very different worlds.",
              poster: "https://m.media-amazon.com/images/I/71EPBeg18IL._AC_SY606_.jpg",
              category: Category.find_by(name: "Comedy"),
              trailer: "https://www.youtube.com/embed/2EBAVoN8L_U?controls=0&amp;start=9;?rel=0&autoplay=1",
              hint_1: "love story",
              hint_2: "unexpected",
              hint_3: "Julia ROBERTS",
            )


Movie.create( title: "Life is beautiful",
              synopsis: "A gentle Jewish-Italian waiter, Guido Orefice, meets Dora, a pretty schoolteacher, and wins her over with his charm and humor. Eventually they marry and have a son, Giosue. Their happiness is abruptly halted, however, when Guido and Giosue are separated from Dora and taken to a concentration camp. Determined to shelter his son from the horrors of his surroundings and the Holocaust, Guido convinces Giosue that their time in the camp is merely a game.",
              poster: "https://img.moviepostershop.com/life-is-beautiful-movie-poster-1998-1020194289.jpg",
              category: Category.find_by(name: "Historical"),
              trailer: "https://www.youtube.com/embed/pAYEQP8gx3w?controls=0&amp;start=22;?rel=0&autoplay=1",
              hint_1: "World War",
              hint_2: "bicycle",
              hint_3: "Italiano",
            )

Movie.create( title: "Dirty Dancing",
              synopsis: "Baby is one listless summer away from the Peace Corps. Hoping to enjoy her youth while it lasts, she's disappointed when her summer plans deposit her at a sleepy resort in the Catskills with her parents. Her luck turns around, however, when the resort's dance instructor, Johnny, enlists Baby as his new partner, and the two fall in love. Baby's father forbids her from seeing Johnny, but she's determined to help him perform the last big dance of the summer.",
              poster: "https://images.affiches-et-posters.com//albums/3/52487/affiche-film-dirty-dancing.jpg",
              category: Category.find_by(name: "Comedy"),
              trailer: "https://www.youtube.com/embed/eIcmQNy9FsM?controls=0&amp;start=47;?rel=0&autoplay=1",
              hint_1: "love story",
              hint_2: "Johnny CASTEL",
              hint_3: "The time of my life",
            )

Movie.create( title: "Taxi Driver",
              synopsis: "Suffering from insomnia, disturbed loner Travis Bickle takes a job as a New York City taxi driver, haunting the streets nightly, growing increasingly detached from reality as he dreams of cleaning up the filthy city. When Travis meets pretty campaign worker Betsy, he becomes obsessed with the idea of saving the world, first plotting to assassinate a presidential candidate, then directing his attentions toward rescuing 12-year-old prostitute Iris.",
              poster: "https://image.posterlounge.fr/images/big/1875963.jpg",
              category: Category.find_by(name: "Drama"),
              trailer: "https://www.youtube.com/embed/UUxD4-dEzn0?controls=0&amp;start=92;?rel=0&autoplay=1",
              hint_1: "SCORSESE",
              hint_2: "DE NIRO",
              hint_3: "yellow cab",
            )

Movie.create( title: "Whiplash",
              synopsis: "Andrew Neiman is an ambitious young jazz drummer, in pursuit of rising to the top of his elite music conservatory. Terence Fletcher, an instructor known for his terrifying teaching methods, discovers Andrew and transfers the aspiring drummer into the top jazz ensemble, forever changing the young man's life. But Andrew's passion to achieve perfection quickly spirals into obsession, as his ruthless teacher pushes him to the brink of his ability and his sanity.",
              poster: "https://i.ebayimg.com/images/g/BGcAAOSwZJBX--Ku/s-l500.jpg",
              category: Category.find_by(name: "Drama"),
              trailer: "https://www.youtube.com/embed/7d_jQycdQGo?controls=0&amp;start=33;?rel=0&autoplay=1",
              hint_1: "transcendence",
              hint_2: "drums",
              hint_3: "jazz",
            )

Movie.create( title: "Back to the Future",
              synopsis: "In this 1980s sci-fi classic, small-town California teen Marty McFly is thrown back into the '50s when an experiment by his eccentric scientist friend Doc Brown goes awry. Traveling through time in a modified DeLorean car, Marty encounters young versions of his parents, and must make sure that they fall in love or he'll cease to exist. Even more dauntingly, Marty has to return to his own time and save the life of Doc Brown.",
              poster: "https://m.media-amazon.com/images/I/51pCtX2StZL._AC_.jpg",
              category: Category.find_by(name: "Comedy"),
              trailer: "https://www.youtube.com/embed/qvsgGtivCgs?controls=0&amp;start=15;?rel=0&autoplay=1",
              hint_1: "distopian",
              hint_2: "time travel",
              hint_3: "DeLorean",
            )

Movie.create( title: "Jaws",
              synopsis: "When a young woman is killed by a shark while skinny-dipping near the New England tourist town of Amity Island, police chief Martin Brody wants to close the beaches, but mayor Larry Vaughn overrules him, fearing that the loss of tourist revenue will cripple the town. Ichthyologist Matt Hooper and grizzled ship captain Quint offer to help Brody capture the killer beast, and the trio engage in an epic battle of man vs. nature.",
              poster: "https://i.ebayimg.com/images/g/p1cAAOSwPc1dvvqv/s-l500.jpg",
              category: Category.find_by(name: "Blockbuster"),
              trailer: "https://www.youtube.com/embed/U1fu_sA7XhE?controls=0&amp;start=120;?rel=0&autoplay=1",
              hint_1: "mutant",
              hint_2: "murder",
              hint_3: "shark",
)

Movie.create( title: "Inception",
              synopsis: "Dom Cobb is a thief with the rare ability to enter people's dreams and steal their secrets from their subconscious. His skill has made him a hot commodity in the world of corporate espionage but has also cost him everything he loves. Cobb gets a chance at redemption when he is offered a seemingly impossible task: Plant an idea in someone's mind. If he succeeds, it will be the perfect crime, but a dangerous enemy anticipates Cobb's every move.",
              poster: "https://m.media-amazon.com/images/I/91Rc8cAmnAL._AC_SY679_.jpg",
              category: Category.find_by(name: "Action"),
              trailer: "https://www.youtube.com/embed/YoHD9XEInc0?controls=0&amp;start=68;?rel=0&autoplay=1",
              hint_1: "nested",
              hint_2: "dreaming",
              hint_3: "DICAPRIO",
)

Movie.create( title: "Pirates of Caribbean",
              synopsis: "Capt. Jack Sparrow arrives at Port Royal in the Caribbean without a ship or crew. His timing is inopportune, however, because later that evening the town is besieged by a pirate ship. The pirates kidnap the governor's daughter, Elizabeth, who's in possession of a valuable coin that is linked to a curse that has transformed the pirates into the undead. A gallant blacksmith in love with Elizabeth allies with Sparrow in pursuit of the pirates.",
              poster: "https://static.posters.cz/image/750/affiches-et-posters/pirates-of-the-caribbean-4-one-sheet-i11028.jpg",
              category: Category.find_by(name: "Action"),
              trailer: "",
              hint_1: "high sea",
              hint_2: "malediction",
              hint_3: "SPARROW",
)
