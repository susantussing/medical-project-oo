MyApp.get "/places" do
  @places = Places.get_clinics(41.2461226,-95.9336376)[0,5]
  @places.map! do |place| 
    Places.get_detail(place["place_id"])
  end
  erb :"places/list"
end