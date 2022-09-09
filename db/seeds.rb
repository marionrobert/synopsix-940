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

Movie.create( title: "top gun",
              synopsis: "Code-named Maverick, Pete Mitchell, an impetuous, daredevil Navy-pilot ace, is accepted into Top Gun, Miramar's elite Fighter School. But there, the impulsive young pilot will have to compete with the best of the best, including Iceman, a brilliant and highly competitive fellow student. Now, Mitchell must give his all; however, his father's mysterious and untimely demise still haunts him. Can Maverick prove his worth to Charlie, and will he be able to suppress his wild nature to win the prestigious Top Gun Trophy ?",
              poster: "https://m.media-amazon.com/images/I/617GD9g5ChL._AC_SY679_.jpg",
              category: Category.find_by(name: "Action"),
              trailer: "https://www.youtube.com/embed/ArOMXELHiLw?controls=0?rel=0&autoplay=1",
              hint_1: "army",
              hint_2: "1986",
              hint_3: "fighterjet",
            )

Movie.create( title: "the lion king",
              synopsis: "This Disney animated feature follows the adventures of the young lion Simba, the heir of his father, Mufasa. Simba's wicked uncle, Scar, plots to usurp Mufasa's throne by luring father and son into a stampede of wildebeests. But Simba escapes, and only Mufasa is killed. Simba returns as an adult to take back his homeland from Scar with the help of his friends Timon and Pumbaa.",
              poster: "https://lumiere-a.akamaihd.net/v1/images/p_thelionking_19752_1_0b9de87b.jpeg",
              category: Category.find_by(name: "Comedy"),
              trailer: "https://www.youtube.com/embed/lFzVJEksoDY?controls=0&amp;start=24;?rel=0&autoplay=1",
              hint_1: "animated",
              hint_2: "savana",
              hint_3: "lion",
            )

Movie.create( title: "the exorcist",
              synopsis: "This tale of an exorcism is based loosely on actual events. When young Regan starts acting odd -- levitating, speaking in tongues -- her worried mother seeks medical help, only to hit a dead end. A local priest, however, thinks the girl may be seized by the devil. The priest makes a request to perform an exorcism, and the church sends in an expert to help with the difficult job.",
              poster: "https://static.posters.cz/image/1300/affiches-et-posters/l-exorciste-i75296.jpg",
              category: Category.find_by(name: "All"),
              trailer: "https://www.youtube.com/embed/YDGw1MTEe9k?controls=0&amp;start=12;?rel=0&autoplay=1",
              hint_1: "curse",
              hint_2: "rolling head",
              hint_3: "possessed",
            )

Movie.create( title: "Memento",
              synopsis: "Leonard is tracking down the man who murdered his wife. The difficulty, however, of locating his wife's killer is compounded by the fact that he suffers from a rare, untreatable form of memory loss. Although he can recall details of life before his accident, Leonard cannot remember what happened fifteen minutes ago, where he's going, or why.",
              poster: "https://m.media-amazon.com/images/I/515EOVqRexL._AC_.jpg",
              category: Category.find_by(name: "Drama"),
              trailer: "https://www.youtube.com/embed/E77LfnMI-34?controls=0&amp;start=14;?rel=0&autoplay=1",
              hint_1: "memory loss",
              hint_2: "photo",
              hint_3: "revenge",
            )

Movie.create( title: "the shining",
              synopsis: "Jack Torrance becomes winter caretaker at the isolated Overlook Hotel in Colorado, hoping to cure his writer's block. He settles in along with his wife, Wendy, and his son, Danny, who is plagued by psychic premonitions. As Jack's writing goes nowhere and Danny's visions become more disturbing, Jack discovers the hotel's dark secrets and begins to unravel into a homicidal maniac hell-bent on terrorizing his family.",
              poster: "https://m.media-amazon.com/images/I/61pzkGe+zBL._AC_SY606_.jpg",
              category: Category.find_by(name: "drama"),
              trailer: "https://www.youtube.com/embed/S014oGZiSdI?controls=0&amp;start=35;?rel=0&autoplay=1",
              hint_1: "1980",
              hint_2: "supernatural",
              hint_3: "Nicholson",
            )

Movie.create( title: "mars attack!",
              synopsis: "A fleet of Martian spacecraft surrounds the world's major cities and all of humanity waits to see if the extraterrestrial visitors have, as they claim, 'come in peace.' U.S. President James Dale receives assurance from science professor Donald Kessler that the Martians' mission is a friendly one. But when a peaceful exchange ends in the total annihilation of the U.S. Congress, military men call for a full-scale nuclear retaliation.",
              poster: "https://m.media-amazon.com/images/I/71aE2jrji8L._AC_SY741_.jpg",
              category: Category.find_by(name: ""),
              trailer: "https://www.youtube.com/embed/DqtjHWlM4lQ?controls=0&amp;start=10;?rel=0&autoplay=1",
              hint_1: "funny",
              hint_2: "extra-terrestrial",
              hint_3: "1996",
            )

Movie.create( title: "terminal",
              synopsis: "When Viktor Navorski, an Eastern European tourist, arrives at JFK in New York, war breaks out in his country and he finds himself caught up in international politics. Because of the war, the Department of Homeland Security won't let him enter or exit the United States. He's trapped at JFK -- indefinitely. While living at the airport, Viktor falls for a flight attendant. She may have feelings for him too. But what good is love if Viktor can't leave the terminal?",
              poster: "https://m.media-amazon.com/images/I/41V1qevn6uL._AC_.jpg",
              category: Category.find_by(name: "Drama"),
              trailer: "https://www.youtube.com/embed/iZqQRmhRvyg?controls=0&amp;start=5;?rel=0&autoplay=1",
              hint_1: "airpor",
              hint_2: "locked Inside",
              hint_3: "Tom HANKS",
            )

Movie.create( title: "catch me if you can",
              synopsis: "Frank Abagnale, Jr. worked as a doctor, a lawyer, and as a co-pilot for a major airline -- all before his 18th birthday. A master of deception, he was also a brilliant forger, whose skill gave him his first real claim to fame: At the age of 17, Frank Abagnale, Jr. became the most successful bank robber in the history of the U.S. FBI Agent Carl Hanratty makes it his prime mission to capture Frank and bring him to justice, but Frank is always one step ahead of him.",
              poster: "https://cine-images.com/wp-content/uploads/2021/03/catch-me-if-you-can-us-1-sheetok.jpg",
              category: Category.find_by(name: "Comedy"),
              trailer: "https://www.youtube.com/embed/s-7pyIxz8Qg?controls=0&amp;start=2;?rel=0&autoplay=1",
              hint_1: "runaway",
              hint_2: "cameleon",
              hint_3: "scam",
            )

Movie.create( title: "Planet of the Apes",
              synopsis: "Complex sociological themes run through this science-fiction classic about three astronauts marooned on a futuristic planet where apes rule and humans are slaves. The stunned trio discovers that these highly intellectual simians can both walk upright and talk. They have even established a class system and a political structure. The astronauts suddenly find themselves part of a devalued species, trapped and imprisoned by the apes.",
              poster: "https://static.displate.com/280x392/displate/2021-10-22/c9e1a031f4d34f8e0024c81cda81c0fb_2f1be8e807f6fc8a00eebc9c9ad9b6a1.jpg",
              category: Category.find_by(name: "Blockbuster"),
              trailer: "https://www.youtube.com/embed/GPgNrHqfTdY?controls=0&amp;start=29;?rel=0&autoplay=1",
              hint_1: "distopian",
              hint_2: "extinction",
              hint_3: "monkey",
            )

Movie.create( title: "reservoir dogs",
              synopsis: "Six criminals with fake names, and each strangers to one another, are hired to carry out a robbery. The heist is ambushed by police and the gang are forced to shoot their way out. At their warehouse rendezvous, the survivors, realising that they were set up, try to find the traitor in their midst.",
              poster: "https://www.cdiscount.com/pdt2/2/5/6/1/700x700/auc2008097926256/rw/reservoir-dogs-affiche-cinema-originale-roulee-pet.jpg",
              category: Category.find_by(name: "Action"),
              trailer: "https://www.youtube.com/embed/vayksn4Y93A?controls=0&amp;start=7;?rel=0&autoplay=1",
              hint_1: "1992",
              hint_2: "Mr PINK",
              hint_3: "TARANTINO",
            )

Movie.create( title: "Inglorious basterds",
              synopsis: "It is the first year of Germany's occupation of France. Allied officer Lt. Aldo Raine assembles a team of Jewish soldiers to commit violent acts of retribution against the Nazis, including the taking of their scalps. He and his men join forces with Bridget von Hammersmark, a German actress and undercover agent, to bring down the leaders of the Third Reich. Their fates converge with theater owner Shosanna Dreyfus, who seeks to avenge the Nazis' execution of her family.",
              poster: "https://i.ebayimg.com/images/g/jyEAAOSwr15ftu57/s-l400.jpg",
              category: Category.find_by(name: "Action"),
              trailer: "https://www.youtube.com/embed/KnrRy6kSFF0?controls=0&amp;start=9;?rel=0&autoplay=1",
              hint_1: "Nazi",
              hint_2: "Christoph WALTZ",
              hint_3: "Brad PITT",
            )

Movie.create( title: "Pulp fiction",
              synopsis: "Vincent Vega and Jules Winnfield are hitmen with a penchant for philosophical discussions. In this ultra-hip, multi-strand crime movie, their storyline is interwoven with those of their boss, gangster Marsellus Wallace; his actress wife, Mia; struggling boxer Butch Coolidge; master fixer Winston Wolfe and a nervous pair of armed robbers, 'Pumpkin' and 'Honey Bunny'.",
              poster: "https://static.posters.cz/image/750webp/1288.webp",
              category: Category.find_by(name: "Blockbuster"),
              trailer: "https://www.youtube.com/embed/s7EdQ4FqbhY?controls=0&amp;start=23;?rel=0&autoplay=1",
              hint_1: "quarter pounder",
              hint_2: "dancing",
              hint_3: "Tarantino",
            )

Movie.create( title: "kill Bill",
              synopsis: "A former assassin, known simply as The Bride, wakes from a coma four years after her jealous ex-lover Bill attempts to murder her on her wedding day. Fueled by an insatiable desire for revenge, she vows to get even with every person who contributed to the loss of her unborn child, her entire wedding party, and four years of her life. After devising a hit list, The Bride sets off on her quest, enduring unspeakable injury and unscrupulous enemies.",
              poster: "https://static.posters.cz/image/1300/affiches-et-posters/kill-bill-vol-1-i97652.jpg",
              category: Category.find_by(name: "Action"),
              trailer: "https://www.youtube.com/embed/7kSuas6mRpk?controls=0&amp;start=9;?rel=0&autoplay=1",
              hint_1: "revenge",
              hint_2: "yellow",
              hint_3: "Uma THURMAN",
            )

Movie.create( title: "Leon",
              synopsis: "Mathilda is only 12 years old, but is already familiar with the dark side of life: her abusive father stores drugs for corrupt police officers, and her mother neglects her. Leon, who lives down the hall, tends to his houseplants and works as a hired hitman for mobster Tony. When her family is murdered by crooked DEA agent Stansfield, Mathilda joins forces with a reluctant Leon to learn his deadly trade and avenge her family's deaths.",
              poster: "https://m.media-amazon.com/images/I/71ezOtH+z5L._AC_SY679_.jpg",
              category: Category.find_by(name: "Drama"),
              trailer: "https://www.youtube.com/embed/jawVxq1Iyl0?controls=0&amp;start=5;?rel=0&autoplay=1",
              hint_1: "hitman",
              hint_2: "Natalie PORTMAN",
              hint_3: "1994",
            )

Movie.create( title: "The Hangover",
              synopsis: "Two days before his wedding, Doug and three friends drive to Las Vegas for a wild and memorable bachelor party. In fact, when the three groomsmen wake up the next morning, they can't remember a thing; nor can they find Doug. With little time to spare, the three hazy pals try to re-trace their steps and find Doug so they can get him back to Los Angeles in time to walk down the aisle.",
              poster: "https://i.ebayimg.com/images/g/LncAAOSws6ReYMp1/s-l500.jpg",
              category: Category.find_by(name: "Comedy"),
              trailer: "https://www.youtube.com/embed/tlize92ffnY?controls=0&amp?rel=0&autoplay=1",
              hint_1: "three friends",
              hint_2: "regrets",
              hint_3: "drunk",
            )

Movie.create( title: "Gladiator",
              synopsis: "Set in Roman times, the story of a once-powerful general forced to become a common gladiator. The emperor's son is enraged when he is passed over as heir in favour of his father's favourite general. He kills his father and arranges the murder of the general's family, and the general is sold into slavery to be trained as a gladiator - but his subsequent popularity in the arena threatens the throne.",
              poster: "https://m.media-amazon.com/images/I/71LPLHCs7HL._AC_SY606_.jpg",
              category: Category.find_by(name: ""),
              trailer: "https://www.youtube.com/embed/owK1qxDselE?controls=0&amp;start=12;?rel=0&autoplay=1",
              hint_1: "medieval",
              hint_2: "Maximus",
              hint_3: "Coliseum",
            )

Movie.create( title: "Harry Potter and the Sorcerer's Stone",
              synopsis: "Adaptation of the first of J.K. Rowling's popular children's novels about Harry Potter, a boy who learns on his eleventh birthday that he is the orphaned son of two powerful wizards and possesses unique magical powers of his own. He is summoned from his life as an unwanted child to become a student at Hogwarts, an English boarding school for wizards. There, he meets several friends who become his closest allies and help him discover the truth about his parents' mysterious deaths.",
              poster: "https://i.ebayimg.com/images/g/nHQAAOSwQ8hhoMr~/s-l500.jpg",
              category: Category.find_by(name: "Comedy"),
              trailer: "https://www.youtube.com/embed/VyHV0BRtdxo?controls=0&amp;start=12;?rel=0&autoplay=1",
              hint_1: "School",
              hint_2: "Magic",
              hint_3: "Poudlard",
            )

Movie.create( title: "I am legend",
              synopsis: "Robert Neville, a brilliant scientist, is a survivor of a man-made plague that transforms humans into bloodthirsty mutants. He wanders alone through New York City, calling out for other possible survivors, and works on finding a cure for the plague using his own immune blood. Neville knows he is badly outnumbered and the odds are against him, and all the while, the infected wait for him to make a mistake that will deliver Neville into their hands.",
              poster: "https://m.media-amazon.com/images/I/51CWMcGcBTL._AC_SY445_.jpg",
              category: Category.find_by(name: "Drama"),
              trailer: "https://www.youtube.com/embed/dtKMEAXyPkg?controls=0&amp;start=5;?rel=0&autoplay=1",
              hint_1: "Infection",
              hint_2: "2007",
              hint_3: "Will SMITH",
            )

Movie.create( title: "Schindler's List",
              synopsis: "Businessman Oskar Schindler arrives in Krakow in 1939, ready to make his fortune from World War II, which has just started. After joining the Nazi party primarily for political expediency, he staffs his factory with Jewish workers for similarly pragmatic reasons. When the SS begins exterminating Jews in the Krakow ghetto, Schindler arranges to have his workers protected and added to a list to keep his factory in operation, but soon realizes that in so doing, he is also saving innocent lives.",
              poster: "https://i5.walmartimages.com/asr/3224d022-cdd3-496a-91b7-ce3bb742a093.bc275f07f77aec99683e2f9d765138bb.jpeg",
              category: Category.find_by(name: "Historical"),
              trailer: "https://www.youtube.com/embed/mxphAlJID9U?controls=0&amp;start=7;?rel=0&autoplay=1",
              hint_1: "Spielberg",
              hint_2: "World War",
              hint_3: "Oskar",
            )

Movie.create( title: "ET the extra-terrestrial",
              synopsis: "After a gentle alien becomes stranded on Earth, the being is discovered and befriended by a young boy named Elliott. Bringing the extraterrestrial into his suburban California house, Elliott introduces E.T., as the alien is dubbed, to his brother and his little sister, Gertie, and the children decide to keep its existence a secret. Soon, however, E.T. falls ill, resulting in government intervention and a dire situation for both Elliott and the alien.",
              poster: "https://m.media-amazon.com/images/I/71bIPWfTGJL._AC_SY679_.jpg",
              category: Category.find_by(name: "Comedy"),
              trailer: "https://www.youtube.com/embed/qYAETtIIClk?controls=0&amp;start=23;?rel=0&autoplay=1",
              hint_1: "bike basket",
              hint_2: "child friendly",
              hint_3: "Alien",
            )

Movie.create( title: "Philadelphia",
              synopsis: "Fearing it would compromise his career, lawyer Andrew Beckett hides his homosexuality and HIV status at a powerful Philadelphia law firm. But his secret is exposed when a colleague spots the illness's telltale lesions. Fired shortly afterwards, Beckett resolves to sue for discrimination, teaming up with Joe Miller, the only lawyer willing to help. In court, they face one of his ex-employer's top litigators, Belinda Conine.",
              poster: "https://m.media-amazon.com/images/I/51fxDBsffWL._AC_.jpg",
              category: Category.find_by(name: "Drama"),
              trailer: "https://www.youtube.com/embed/CKDz2LVHz0Y?controls=0&amp;start=7;?rel=0&autoplay=1",
              hint_1: "justice",
              hint_2: "disease",
              hint_3: "AIDS",
            )

Movie.create( title: "Bodyguard",
              synopsis: "Best-selling pop diva Rachel Marron has a stalker whose obsession has risen to the level of disturbing threats. At the urging of her manager, Rachel hires former secret service agent Frank Farmer as her bodyguard. Initially resented and treated with disdain for his hard-nosed security procedures, Farmer soon becomes an integral part of Rachel's inner circle. As they spend more time together, client and protector become closer still.",
              poster: "https://images.affiches-et-posters.com//albums/3/2978/medium/bodyguard.JPG",
              category: Category.find_by(name: "Drama"),
              trailer: "https://www.youtube.com/embed/4JFRdJTszRM?controls=0&amp;start=7;?rel=0&autoplay=1",
              hint_1: "protection",
              hint_2: "USA",
              hint_3: "W.HOUSTON",
            )

Movie.create( title: "Slumdog millionnaire",
              synopsis: "As 18-year-old Jamal Malik answers questions on the Indian version of 'Who Wants to Be a Millionaire,' flashbacks show how he got there. Part of a stable of young thieves after their mother dies, Jamal and his brother, Salim, survive on the streets of Mumbai. Salim finds the life of crime agreeable, but Jamal scrapes by with small jobs until landing a spot on the game show. He wins the game and reunites with his love, Latika.",
              poster: "https://m.media-amazon.com/images/I/61GZJceT25L._AC_SY606_.jpg",
              category: Category.find_by(name: "Drama"),
              trailer: "https://www.youtube.com/embed/AIzbwV7on6Q?controls=0&amp;start=16;?rel=0&autoplay=1",
              hint_1: "Quizz",
              hint_2: "India",
              hint_3: "Life story",
            )
