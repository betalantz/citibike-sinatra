


module Citibike
	class App < Sinatra::Base
    # configure :development do
    #   register Sinatra::Reloader
    # end

    before do
      json = File.open("data/citibikenyc.json").read
      @data = MultiJson.load(json)
    end

    get '/' do
      erb :home
    end

    get '/form' do
      erb :form
    end

    post '/form' do
      @result = params
      erb :result
    end

    post '/map' do
      # binding.pry
      start, finish = params[:start].split(" "), params[:end].split(" ")
      @s_lat = start[0].gsub(/[^-0-9]/, "").to_f/1000000.0
      @s_lng = start[1].gsub(/[^-0-9]/, "").to_f/1000000.0
      @e_lat = finish[0].gsub(/[^-0-9]/, "").to_f/1000000.0
      @e_lng = finish[1].gsub(/[^-0-9]/, "").to_f/1000000.0
      erb :map
    end

  end
end