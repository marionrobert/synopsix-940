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
              category: Category.find_by(name: "Drama"),
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

Movie.create( title: "The Departed",
              synopsis: "South Boston cop Billy Costigan goes undercover to infiltrate the organization of gangland chief Frank Costello. As Billy gains the mobster's trust, a career criminal named Colin Sullivan infiltrates the police department and reports on its activities to his syndicate bosses. When both organizations learn they have a mole in their midst, Billy and Colin must figure out each other's identities to save their own lives.",
              poster: " https://m.media-amazon.com/images/I/51ysmjUAA2L._AC_.jpg",
              category: Category.find_by(name: "Drama"),
              trailer: "https://www.youtube.com/embed/SGWvwjZ0eDc?controls=0&amp;start=6;?rel=0&autoplay=1",
              hint_1: "Colin Sullivan",
              hint_2: "Boston",
              hint_3: "DiCaprio",
            )

Movie.create( title: "Amelie",
              synopsis: "Amelie is a fanciful comedy about a young woman who discretely orchestrates the lives of the people around her, creating a world exclusively of her own making. Shot in over 80 Parisian locations, acclaimed director Jean-Pierre Jeunet invokes his incomparable visionary style to capture the exquisite charm and mystery of modern-day Paris through the eyes of a beautiful ingenue.",
              poster: " https://m.media-amazon.com/images/I/51qu38-66JL._AC_.jpg",
              category: Category.find_by(name: "Comedy"),
              trailer: "https://www.youtube.com/embed/HUECWi5pX7o?controls=0&amp;start=5;?rel=0&autoplay=1",
              hint_1: "Paris",
              hint_2: "Montmartre",
              hint_3: "Jamel Debbouze",
            )

Movie.create( title: "Skyfall",
              synopsis: "When James Bond's latest assignment goes terribly wrong, it leads to a calamitous turn of events: Undercover agents around the world are exposed, and MI6 is attacked, forcing M to relocate the agency. With MI6 now compromised inside and out, M turns to the one man she can trust: Bond. Aided only by a field agent, Bond takes to the shadows and follows a trail to Silva, a man from M's past who wants to settle an old score.",
              poster: "https://fr.web.img6.acsta.net/medias/nmedia/18/88/95/51/20264212.jpg",
              category: Category.find_by(name: "Action"),
              trailer: "https://www.youtube.com/embed/6kw1UVovByw?controls=0&amp;start=92;?rel=0&autoplay=1",
              hint_1: "Daniel",
              hint_2: "James",
              hint_3: "Adele",
            )

Movie.create( title: "Good Will Hunting",
              synopsis: "Will Hunting has a genius-level IQ but chooses to work as a janitor at MIT. When he solves a difficult graduate-level math problem, his talents are discovered by Professor Gerald Lambeau, who decides to help the misguided youth reach his potential. When Will is arrested for attacking a police officer, Professor Lambeau makes a deal to get leniency for him if he will get treatment from therapist Sean Maguire.",
              poster: "https://m.media-amazon.com/images/I/71TxoeCi7hL._AC_SY550_.jpg",
              category: Category.find_by(name: "Drama"),
              trailer: "https://www.youtube.com/embed/ReIJ1lbL-Q8?controls=0&amp;start=95;?rel=0&autoplay=1",
              hint_1: "MIT",
              hint_2: "Genius",
              hint_3: "Robin Williams",
            )

Movie.create( title: "Star Wars",
              synopsis: "The Imperial Forces -- under orders from cruel Darth Vader -- hold Princess Leia hostage, in their efforts to quell the rebellion against the Galactic Empire. Luke Skywalker and Han Solo, captain of the Millennium Falcon, work together with the companionable droid duo R2-D2 and C-3PO to rescue the beautiful princess, help the Rebel Alliance, and restore freedom and justice to the Galaxy.",
              poster: "https://static.posters.cz/image/1300/affiches-et-posters/star-wars-classic-i97850.jpg",
              category: Category.find_by(name: "Blockbuster"),
              trailer: "https://www.youtube.com/embed/1g3_CFmnU7k?controls=0&amp;start=1;?rel=0&autoplay=1",
              hint_1: "Space",
              hint_2: "Laser",
              hint_3: "Chewbacca",
            )

Movie.create( title: "The Silence of the Lambs",
              synopsis: "Clarice Starling is a top student at the FBI's training academy. Jack Crawford wants Clarice to interview Dr. Hannibal Lecter, a brilliant psychiatrist who is also a violent psychopath, serving life behind bars for various acts of murder and cannibalism. Crawford believes that Lecter may have insight into a case and that Starling, as an attractive young woman, may be just the bait to draw him out.",
              poster: "https://m.media-amazon.com/images/I/717YaOenhOS._AC_SX425_.jpg",
              category: Category.find_by(name: "Drama"),
              trailer: "https://www.youtube.com/embed/W6Mm8Sbe__o?controls=0&amp;start=41;?rel=0&autoplay=1",
              hint_1: "FBI",
              hint_2: "Lecter",
              hint_3: "Basket",
            )
Movie.create( title: "Iron Man",
              synopsis: "A billionaire industrialist and genius inventor, Tony Stark, is conducting weapons tests overseas, but terrorists kidnap him to force him to build a devastating weapon. Instead, he builds an armored suit and upends his captors. Returning to America, Stark refines the suit and uses it to combat crime and terrorism.",
              poster: "https://movieposters2.com/images/764582-b.jpg",
              category: Category.find_by(name: "Blockbuster"),
              trailer: "https://www.youtube.com/embed/8ugaeA-nMTc?controls=0&amp;start=93;?rel=0&autoplay=1",
              hint_1: "Hostage",
              hint_2: "Steel",
              hint_3: "Superhero",
            )

Movie.create( title: "The Sixth Sense",
              synopsis: "Young Cole Sear is haunted by a dark secret: he is visited by ghosts. Cole is frightened by visitations from dead people with unresolved problems who appear from the shadows. He is too afraid to tell anyone about his anguish, except child psychologist Dr. Malcolm Crowe. As Dr. Crowe tries to uncover the truth about Cole's supernatural abilities, the consequences for client and therapist are a jolt that awakens them both to something unexplainable.",
              poster: "https://i.pinimg.com/originals/18/cf/eb/18cfeb210b2ff8c444455c30975ffed3.jpg",
              category: Category.find_by(name: "Drama"),
              trailer: "https://www.youtube.com/embed/lXO0he1WjYw?controls=0&amp;start=19;?rel=0&autoplay=1",
              hint_1: "Child",
              hint_2: "Scared",
              hint_3: "Dead People",
            )

Movie.create( title: "Wonder Woman",
              synopsis: "Before she was Wonder Woman, she was Diana, princess of the Amazons, trained to be an unconquerable warrior. Raised on a sheltered island paradise, Diana meets an American pilot who tells her about the massive conflict that's raging in the outside world. Convinced that she can stop the threat, Diana leaves her home for the first time. Fighting alongside men in a war to end all wars, she finally discovers her full powers and true destiny.",
              poster: "https://m.media-amazon.com/images/I/51WKYFaCKGL._AC_.jpg",
              category: Category.find_by(name: "Blockbuster"),
              trailer: "https://www.youtube.com/embed/1Q8fG0TtVAY?controls=0&amp;start=82;?rel=0&autoplay=1",
              hint_1: "Superhero",
              hint_2: "Crown",
              hint_3: "Female",
            )

Movie.create( title: "The Shawshank Redemption",
              synopsis: "Andy Dufresne is sentenced to two consecutive life terms in prison for the murders of his wife and her lover and is sentenced to a tough prison. However, only Andy knows he didn't commit the crimes. While there, he forms a friendship with Red, experiences brutality of prison life, adapts, helps the warden, and plans his escape, all in 19 years.",
              poster: "https://i.pinimg.com/originals/d2/cd/02/d2cd029a53ffae33031583c3911123a6.jpg",
              category: Category.find_by(name: "Drama"),
              trailer: "https://www.youtube.com/embed/6hB3S9bIaco?controls=0&amp;start=73;?rel=0&autoplay=1",
              hint_1: "Jail",
              hint_2: "Friendship",
              hint_3: "Escape",
            )

Movie.create( title: "The Hunger Games",
              synopsis: "In what was once North America, the Capitol of Panem maintains its hold on its 12 districts by forcing them each to select a boy and a girl, called Tributes, to compete in a nationally televised event called the Hunger Games. Every citizen must watch as the youths fight to the death until only one remains. District 12 Tribute Katniss Everdeen has little to rely on, other than her hunting skills and sharp instincts, in an arena where she must weigh survival against love.",
              poster: "https://media.services.cinergy.ch/media/cinemanteaser149x206x2/0c25bfe7d8dda748b8a18589",
              category: Category.find_by(name: "Action"),
              trailer: "https://www.youtube.com/embed/mfmrPu43DF8?controls=0&amp;start=58;?rel=0&autoplay=1",
              hint_1: "Bow and Arrow",
              hint_2: "Battle",
              hint_3: "Jennifer",
            )

Movie.create( title: "Black Panther",
              synopsis: "After the death of his father, T'Challa returns home to the African nation of Wakanda to take his rightful place as king. When a powerful enemy suddenly reappears, T'Challa's mettle as king -- and as Black Panther -- gets tested when he's drawn into a conflict that puts the fate of Wakanda and the entire world at risk. Faced with treachery and danger, the young king must rally his allies and release the full power of Black Panther to defeat his foes and secure the safety of his people.",
              poster: "https://m.media-amazon.com/images/I/610EYYAr+YL._AC_.jpg",
              category: Category.find_by(name: "Blockbuster"),
              trailer: "https://www.youtube.com/embed/xjDjIWPwcPU?controls=0&amp;start=67;?rel=0&autoplay=1",
              hint_1: "King",
              hint_2: "Marvel",
              hint_3: "Feline",
            )

Movie.create( title: "Fight Club",
              synopsis: "A depressed man suffering from insomnia meets a strange soap salesman named Tyler Durden and soon finds himself living in his squalid house after his perfect apartment is destroyed. The two bored men form an underground club with strict rules and fight other men who are fed up with their mundane lives. Their perfect partnership frays when Marla, a fellow support group crasher, attracts Tyler's attention.",
              poster: "https://m.media-amazon.com/images/I/51OKMqB5ykL._AC_.jpg",
              category: Category.find_by(name: "Drama"),
              trailer: "https://www.youtube.com/embed/qtRKdVHc-cE?controls=0&amp;start=86;?rel=0&autoplay=1",
              hint_1: "Rules",
              hint_2: "Bipolar",
              hint_3: "Tyler Durden",
            )


Movie.create( title: "The Matrix",
              synopsis: "Neo believes that Morpheus, an elusive figure considered to be the most dangerous man alive, can answer his question -- What is the Matrix? Neo is contacted by Trinity, a beautiful stranger who leads him into an underworld where he meets Morpheus. They fight a brutal battle for their lives against a cadre of viciously intelligent secret agents. It is a truth that could cost Neo something more precious than his life.",
              poster: "https://i.ebayimg.com/images/g/SGMAAOSwXrdZ9DRX/s-l500.jpg",
              category: Category.find_by(name: "Blockbuster"),
              trailer: "https://www.youtube.com/embed/vKQi3bBA1y8?controls=0&amp;start=18;?rel=0&autoplay=1",
              hint_1: "Pills",
              hint_2: "Payphone",
              hint_3: "Neo",
            )

Movie.create( title: "Rocky",
              synopsis: "Rocky Balboa, a small-time boxer from working-class Philadelphia, is arbitrarily chosen to take on the reigning world heavyweight champion, Apollo Creed (Carl Weathers), when the undefeated fighter's scheduled opponent is injured. While training with feisty former bantamweight contender Mickey Goldmill, Rocky tentatively begins a relationship with Adrian.",
              poster: " https://static.posters.cz/image/1300/affiches-et-posters/rocky-main-poster-i116373.jpg",
              category: Category.find_by(name: "Drama"),
              trailer: "https://www.youtube.com/embed/7RYpJAUMo2M?controls=0&amp;start=9;?rel=0&autoplay=1",
              hint_1: "Stairs",
              hint_2: "Philadelphia",
              hint_3: "Boxing",
            )

Movie.create( title: "Die Hard",
              synopsis: "New York City policeman John McClane is visiting his estranged wife and two daughters on Christmas Eve. He joins her at a holiday party in the headquarters of Nakatomi Plaza, the Japanese-owned business she works for. But the festivities are interrupted by a group of terrorists who take over the exclusive high-rise, and everyone in it. Very soon McClane realizes that there's no one to save the hostages -- but him.",
              poster: "https://image.posterlounge.fr/images/big/1875924.jpg",
              category: Category.find_by(name: "Action"),
              trailer: "https://www.youtube.com/embed/jaJuwKCmJbY?controls=0&amp;start=2;?rel=0&autoplay=1",
              hint_1: "Tower",
              hint_2: "Christmas",
              hint_3: "Yippee",
            )

Movie.create( title: "Interstellar",
              synopsis: "In Earth's future, a global crop blight and second Dust Bowl are slowly rendering the planet uninhabitable. Professor Brand, a brilliant NASA physicist, is working on plans to save mankind by transporting Earth's population to a new home via a wormhole. But first, Brand must send former NASA pilot Cooper and a team of researchers through the wormhole and across the galaxy to find out which of three planets could be mankind's new home.",
              poster: "https://m.media-amazon.com/images/I/91obuWzA3XL._AC_SY679_.jpg",
              category: Category.find_by(name: "Drama"),
              trailer: "https://www.youtube.com/embed/zSWdZVtXT7E?controls=0&amp;start=73;?rel=0&autoplay=1",
              hint_1: "Sand Storm",
              hint_2: "Space",
              hint_3: "Dystopian",
            )

Movie.create( title: "Akira",
              synopsis: "In 1988 the Japanese government drops an atomic bomb on Tokyo after ESP experiments on children go awry. In 2019, 31 years after the nuking of the city, Kaneda, a bike gang leader, tries to save his friend Tetsuo from a secret government project. He battles anti-government activists, greedy politicians, irresponsible scientists and a powerful military leader until Tetsuo's supernatural powers suddenly manifest. A final battle is fought in Tokyo Olympiad exposing the experiment's secrets.",
              poster: "https://m.media-amazon.com/images/I/41XRZ7AWYWL._AC_.jpg",
              category: Category.find_by(name: "Drama"),
              trailer: "https://www.youtube.com/embed/nA8KmHC2Z-g?controls=0&amp;start=8;?rel=0&autoplay=1",
              hint_1: "Manga",
              hint_2: "Red Motorbike",
              hint_3: "Nuclear",
            )

Movie.create( title: "Ghostbusters",
              synopsis: "After the members of a team of scientists lose their jobs at a university in New York City, they decide to become ghostbusters to wage a high-tech battle with the supernatural for money. They stumble upon a gateway to another dimension, a doorway that will release ghosts, goblins, and evil upon the city. The Ghostbusters must now save New York from complete destruction.",
              poster: "https://m.media-amazon.com/images/I/51gNMwJ-VEL._AC_SY606_.jpg",
              category: Category.find_by(name: "Comedy"),
              trailer: "https://www.youtube.com/embed/6hDkhw5Wkas?controls=0&amp;start=8;?rel=0&autoplay=1",
              hint_1: "Vacuum cleaner",
              hint_2: "Paranormal",
              hint_3: "Slimer",
            )

Movie.create( title: "Jurassic Park",
              synopsis: "In Steven Spielberg's massive blockbuster, paleontologists Alan Grant and Ellie Sattler and mathematician Ian Malcolm are among a select group chosen to tour an island theme park populated by dinosaurs created from prehistoric DNA. While the park's mastermind, billionaire John Hammond, assures everyone that the facility is safe, they find out otherwise when various ferocious predators escape and go on the hunt.",
              poster: "https://m.media-amazon.com/images/I/913uLOi3rpL._AC_SY606_.jpg",
              category: Category.find_by(name: "Blockbuster"),
              trailer: "https://www.youtube.com/embed/lc0UehYemQA?controls=0&amp;start=12;?rel=0&autoplay=1",
              hint_1: "Island",
              hint_2: "DNA",
              hint_3: "Dinosaurs",
            )

Movie.create( title: "The Dark Knight",
              synopsis: "With the help of allies Lt. Jim Gordon and DA Harvey Dent, Batman has been able to keep a tight lid on crime in Gotham City. But when a vile young criminal calling himself the Joker suddenly throws the town into chaos, the caped Crusader begins to tread a fine line between heroism and vigilantism.",
              poster: "https://m.media-amazon.com/images/I/81rGCm0PyHL._AC_SL1500_.jpg",
              category: Category.find_by(name: "Action"),
              trailer: "https://www.youtube.com/embed/EXeTwQWrcwY?controls=0&amp;start=13;?rel=0&autoplay=1",
              hint_1: "Justice",
              hint_2: "Rachel",
              hint_3: "Joker",
            )

Movie.create( title: "Blade Runner",
              synopsis: " In the year 2019, ex-detective Rick Deckard is called out of retirement to track down and eliminate a team of humanoid androids that have escaped from an outer space mining colony and have taken refuge here on Earth. During his search for the fugitives, he discovers some disturbing secrets about the future plans of the androids' manufacturer, the Tyrell Corporation.",
              poster: " https://m.media-amazon.com/images/I/61dVSMH76yL._AC_SY606_.jpg",
              category: Category.find_by(name: "Action"),
              trailer: "https://www.youtube.com/embed/eogpIG53Cis?controls=0&amp;start=11;?rel=0&autoplay=1",
              hint_1: "Future",
              hint_2: "Ridley Scott",
              hint_3: "Androids",
            )

Movie.create( title: "Men in Black",
              synopsis: "They are the best-kept secret in the universe. Working for a highly funded yet unofficial government agency, Kay and Jay are the Men in Black, providers of immigration services and regulators of all things alien on Earth. While investigating a series of unregistered close encounters, the MIB agents uncover the deadly plot of an intergalactic terrorist who is on a mission to assassinate two ambassadors from opposing galaxies currently in residence in New York City.",
              poster: "https://i.etsystatic.com/30490360/r/il/75be61/3709842237/il_570xN.3709842237_hdpc.jpg",
              category: Category.find_by(name: "Blockbuster"),
              trailer: "https://www.youtube.com/embed/1Q4mhYF9aQQ?controls=0&amp;start=20;?rel=0&autoplay=1",
              hint_1: "Alien",
              hint_2: "Memory",
              hint_3: "Suits",
            )


Movie.create( title: "Slumdog Millionaire",
              synopsis: "As 18-year-old Jamal Malik answers questions on the Indian version of "Who Wants to Be a Millionaire," flashbacks show how he got there. Part of a stable of young thieves after their mother dies, Jamal and his brother, Salim, survive on the streets of Mumbai. Salim finds the life of crime agreeable, but Jamal scrapes by with small jobs until landing a spot on the game show. He wins the game and reunites with his love, Latika.",
              poster: "https://m.media-amazon.com/images/I/61GZJceT25L._AC_SY606_.jpg",
              category: Category.find_by(name: "Drama"),
              trailer: "https://www.youtube.com/embed/AIzbwV7on6Q?controls=0&amp;start=16;?rel=0&autoplay=1",
              hint_1: "Life Story",
              hint_2: "Quiz",
              hint_3: "India",
            )

