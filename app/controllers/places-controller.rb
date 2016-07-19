MyApp.get "/places" do
  @places = Places.get_clinics(41.2461226,-95.9336376)["results"]
  erb :"places/list"
end