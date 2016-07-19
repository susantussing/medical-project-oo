require_relative "secret.rb"

class Places

  def Places.get_clinics (latitude, longitude)
    response = HTTParty.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=#{API_KEY}&location=#{latitude},#{longitude}&type=hospital&rankby=distance")

    places = response["results"]
    places.map! {|place| Places.get_detail(place["place_id"])}
    return places
  end

  def Places.get_detail (placeID)
    response = HTTParty.get("https://maps.googleapis.com/maps/api/place/details/json?key=#{API_KEY}&placeid=#{placeID}")
    return response["result"]
  end
end