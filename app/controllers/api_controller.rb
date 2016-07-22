MyApp.get "/api/diseases" do
  return Record.listDiseasesJSON
end

MyApp.get "/api/diseases/:id" do
  return Record.listSymptomsJSON(params[:id].to_i)
end