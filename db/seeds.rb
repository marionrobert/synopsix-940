# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

moviesarray =  [
  "tt13314558/",
  "tt11866324/",
  "tt12593682/",
  "tt10954984/",
  "tt1745960/",
  "tt9764362/",
  "tt3704428/",
  "tt12262116/",
  "tt1649418/",
  "tt11851548/",
  "tt4614584/",
  "tt7144666/",
  "tt14298328/",
  "tt0077631/",
  "tt13223398/",
  "tt10648342/",
  "tt8110652/",
  "tt11976532/",
  "tt1464335/",
  "tt14001894/",
  "tt10028196/",
  "tt10298810/",
  "tt15325794/",
  "tt0092099/",
  "tt9411972/",
  "tt6710474/",
  "tt8041270/",
  "tt13560574/",
  "tt7214954/",
  "tt11271038/",
  "tt10886166/",
  "tt13320622/",
  "tt14614892/",
  "tt8912936/",
  "tt0093773/",
  "tt1877830/",
  "tt11138512/",
  "tt1148204/",
  "tt0068646/",
  "tt0120828/",
  "tt9419884/",
  "tt3829266/",
  "tt5113044/",
  "tt21106646/",
  "tt10872600/",
  "tt3799694/",
  "tt12724306/",
  "tt0104694/",
  "tt10168670/",
  "tt13664684/",
  "tt9731386/",
  "tt10268488/",
  "tt8178634/",
  "tt14596320/",
  "tt14502344/",
  "tt21237030/",
  "tt6467266/",
  "tt9198364/",
  "tt5500218/",
  "tt0111161/",
  "tt10731256/",
  "tt7131622/",
  "tt12873562/",
  "tt15255876/",
  "tt5052448/",
  "tt1160419/",
  "tt1517268/",
  "tt14814040/",
  "tt1424381/",
  "tt1630029/",
  "tt5834426/",
  "tt12996154/",
  "tt15978956/",
  "tt21340300/",
  "tt11214590/",
  "tt1655441/",
  "tt1833116/",
  "tt0100403/",
  "tt11426572/",
  "tt4513678/",
  "tt7657566/",
  "tt0109830/",
  "tt0110912/",
  "tt0120737/",
  "tt0116483/",
  "tt0816692/",
  "tt11291274/",
  "tt0083929/",
  "tt13698942/",
  "tt0113277/",
  "tt8772262/",
  "tt9288046/",
  "tt2980592/",
  "tt12477480/",
  "tt0119081/",
  "tt12789558/",
  "tt13660916/",
  "tt0993846/",
  "tt4123432/",
  "tt14549466/"
]

Movie.destroy_all

Category.create(name: "default")


moviesarray.each do |movie|
  sleep(1)  # API BLOCKED TOO MUCH REQUEST PER SECOND
    url = URI("https://online-movie-database.p.rapidapi.com/title/get-plots?tconst=#{movie}")


  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request = Net::HTTP::Get.new(url)
  request["X-RapidAPI-Key"] = ENV["RAPID_API_KEY"]
  request["X-RapidAPI-Host"] = 'online-movie-database.p.rapidapi.com'

  response = http.request(request)
  data = response.read_body   #WE GET ALL ABOUT ONE MOVIE

  plot_array = JSON.parse(data)["plots"].map do |plot|      # WE PARSE TO ISOLATE EACH DATA
               plot["text"]
  end

  plot_length = plot_array.sort_by do |plot|       # WE SORT BY LENGTH EVERY PLOTS
                plot.length
  end

  plot = plot_length.last   # WE CHOOSE THE LONGER ONE SO...THE LAST ONE
  poster_url = JSON.parse(data)["base"]["image"]["url"]  # WE GET THE POSTER
  movie_title = JSON.parse(data)["base"]["title"] # WE GET THE MOVIE TITLE

if plot.length > 400  # A VOIR LA LONGUEUR SOUHAITE
Movie.create!(synopsis: plot, poster: poster_url, title: movie_title, category: Category.all.sample)
# WE BUILD THE DB WITH THE SEED
end


end


#Movie.create!(title: "Titanic", synopsis:"Deep-sea explorer Brock Lovett has reached the most famous shipwreck of all - the Titanic. Emerging with a safe believed to contain a diamond called 'The Heart of the Ocean', he discovers the safe does not hold the diamond but a drawing of a beautiful woman wearing it. When Brock is later interviewed on TV, he shows the drawing to the cameras, and a 100-year-old woman named Rose Calvert living in Michigan recognizes the woman in the drawing - herself! On a visit to Brock's explorer ship over the wreck, Rose tells her story of the Titanic and its ill-fated voyage. Engaged to a would-be steel magnate, Caledon Hockley, she boards the Titanic's first-class suites with him and her mother in Southampton. Also boarding are Jack Dawson and his best friend Fabrizio De Rossi, after a lucky poker game wins them tickets in steerage. When Rose attempts suicide by jumping off the stern in third-class, Jack pulls her back onto the ship... and a bond is forged between them as Jack is invited by her into first-class the following day. Rose's mother and Caledon Hockley try desperate measures to keep them apart. But that strategy goes out the window when the Titanic collides with an iceberg, and due to a design flaw begins to sink - despite being proclaimed 'unsinkable'. Now Rose and Jack must fight to stay alive, but is young Jack already doomed because of his lower status as a steerage passenger?",
#poster: "https://i.f1g.fr/media/figaro/orig/2017/01/02/XVM6b8cdc20-d115-11e6-8bd8-580394ba5090.jpg",category: Category.last)
