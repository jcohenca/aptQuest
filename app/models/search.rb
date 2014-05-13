require 'pry'
class Search < ActiveRecord::Base
  belongs_to :user

  Yelp.configure(:yws_id          => 'wI-IeFEyCH7wtK7pnjjN3Q',
                 :consumer_key    => 'yVTzyc9fbaCu1pNipJkRzA',
                 :consumer_secret => 'i24PY51TjhOe3_aT8XwmNA7_vJ0',
                 :token           => '3ACW86hcthAxJslUG_HqRDZDazDZTVth',
                 :token_secret    => 'OAEAtQPZnhna33YkLPzsR43hpJU')


  def self.yelp_search(type)

    client = Yelp::Client.new
    request = Yelp::V2::Search::Request::GeoPoint.new(
                :term            =>  type,
                :latitude        => '40.76741260000001',  
                :longitude       => '-73.98381810000001')

    response = client.search(request)
    final_return = response["businesses"].sort_by {|b| b["distance"]}.first["name"]

  end 
  end

 

