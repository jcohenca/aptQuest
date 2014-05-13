require 'pry'
class Search < ActiveRecord::Base
  belongs_to :user

  Yelp.configure(:yws_id          => 'wI-IeFEyCH7wtK7pnjjN3Q',
                 :consumer_key    => 'yVTzyc9fbaCu1pNipJkRzA',
                 :consumer_secret => 'i24PY51TjhOe3_aT8XwmNA7_vJ0',
                 :token           => '3ACW86hcthAxJslUG_HqRDZDazDZTVth',
                 :token_secret    => 'OAEAtQPZnhna33YkLPzsR43hpJU')


  def self.yelp_search(term)

    client = Yelp::Client.new
    request = Yelp::V2::Search::Request::GeoPoint.new(
                :term            =>  term,
                :latitude        => '40.740289',  
                :longitude       => '-73.981314')
   
    response = client.search(request)
    final_return = response["businesses"].sort_by {|x| x["distance"]}.first["name"]

  end 


    def self.distance(term)

    client = Yelp::Client.new
    request = Yelp::V2::Search::Request::GeoPoint.new(
                :term            =>  term,
                :latitude        => '40.740289',  
                :longitude       => '-73.981314')
   
    response = client.search(request)
    final_return = response["businesses"].sort_by {|x| x["distance"]}.first["distance"]
  end 


end

 

