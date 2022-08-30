class MoviesController < ApplicationController

  def new
  end

  def create
  end

  def destroy
  end




  def seeding
      movieresult = []
      moviesarray = allmovies

      moviesarray.each do |movie|
        url = URI("https://online-movie-database.p.rapidapi.com/#{movie}")


        #SOMETHING MISSING HERE

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["X-RapidAPI-Key"] = '53db1e7db8msh637a665b48e0679p10a88djsn58cb9ab8e37e'
        request["X-RapidAPI-Host"] = 'online-movie-database.p.rapidapi.com'

        response = http.request(request)
        response.read_body
        puts response.read_body
        # Movie.create = response.read_body.base.plots et itéré   #donne un fichier JSON?
      end
    end


    private
    def allmovies
      [
        "/title/tt13314558/",
        "/title/tt11866324/",
        "/title/tt12593682/",
        "/title/tt10954984/",
        "/title/tt1745960/",
        "/title/tt9764362/",
        "/title/tt3704428/",
        "/title/tt12262116/",
        "/title/tt1649418/",
        "/title/tt11851548/",
        "/title/tt4614584/",
        "/title/tt7144666/",
        "/title/tt14298328/",
        "/title/tt0077631/",
        "/title/tt13223398/",
        "/title/tt10648342/",
        "/title/tt8110652/",
        "/title/tt11976532/",
        "/title/tt1464335/",
        "/title/tt14001894/",
        "/title/tt10028196/",
        "/title/tt10298810/",
        "/title/tt15325794/",
        "/title/tt0092099/",
        "/title/tt9411972/",
        "/title/tt6710474/",
        "/title/tt8041270/",
        "/title/tt13560574/",
        "/title/tt7214954/",
        "/title/tt11271038/",
        "/title/tt10886166/",
        "/title/tt13320622/",
        "/title/tt14614892/",
        "/title/tt8912936/",
        "/title/tt0093773/",
        "/title/tt1877830/",
        "/title/tt11138512/",
        "/title/tt1148204/",
        "/title/tt0068646/",
        "/title/tt0120828/",
        "/title/tt9419884/",
        "/title/tt3829266/",
        "/title/tt5113044/",
        "/title/tt21106646/",
        "/title/tt10872600/",
        "/title/tt3799694/",
        "/title/tt12724306/",
        "/title/tt0104694/",
        "/title/tt10168670/",
        "/title/tt13664684/",
        "/title/tt9731386/",
        "/title/tt10268488/",
        "/title/tt8178634/",
        "/title/tt14596320/",
        "/title/tt14502344/",
        "/title/tt21237030/",
        "/title/tt6467266/",
        "/title/tt9198364/",
        "/title/tt5500218/",
        "/title/tt0111161/",
        "/title/tt10731256/",
        "/title/tt7131622/",
        "/title/tt12873562/",
        "/title/tt15255876/",
        "/title/tt5052448/",
        "/title/tt1160419/",
        "/title/tt1517268/",
        "/title/tt14814040/",
        "/title/tt1424381/",
        "/title/tt1630029/",
        "/title/tt5834426/",
        "/title/tt12996154/",
        "/title/tt15978956/",
        "/title/tt21340300/",
        "/title/tt11214590/",
        "/title/tt1655441/",
        "/title/tt1833116/",
        "/title/tt0100403/",
        "/title/tt11426572/",
        "/title/tt4513678/",
        "/title/tt7657566/",
        "/title/tt0109830/",
        "/title/tt0110912/",
        "/title/tt0120737/",
        "/title/tt0116483/",
        "/title/tt0816692/",
        "/title/tt11291274/",
        "/title/tt0083929/",
        "/title/tt13698942/",
        "/title/tt0113277/",
        "/title/tt8772262/",
        "/title/tt9288046/",
        "/title/tt2980592/",
        "/title/tt12477480/",
        "/title/tt0119081/",
        "/title/tt12789558/",
        "/title/tt13660916/",
        "/title/tt0993846/",
        "/title/tt4123432/",
        "/title/tt14549466/"
      ]
    end

end
