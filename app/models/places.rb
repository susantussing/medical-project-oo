require_relative "secret.rb"

class Places
  def Places.get_clinics (latitude, longitude)
    response = HTTParty.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=#{API_KEY}&location=#{latitude},#{longitude}&type=hospital&rankby=distance")
    return response
  end
end