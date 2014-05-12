class Search < ActiveRecord::Base
  belongs_to :user




  def self.yelp_search

  client = Yelp::Client.new
  
  request = Yelp::V2::Search::Request::GeoPoint.new(
              :latitude        => '39.62994399999999',
              :longitude       => '-78.746465',
              :yws_id          => 'wI-IeFEyCH7wtK7pnjjN3Q',
              :consumer_key    => 'yVTzyc9fbaCu1pNipJkRzA',
              :consumer_secret => 'i24PY51TjhOe3_aT8XwmNA7_vJ0',
              :token           => '3ACW86hcthAxJslUG_HqRDZDazDZTVth',
              :token_secret    => 'OAEAtQPZnhna33YkLPzsR43hpJU')

  @response = client.search(request)

  end


end