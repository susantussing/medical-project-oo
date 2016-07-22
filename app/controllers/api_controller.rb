require 'json'

MyApp.get "/api/diseases" do
  content_type :json
  Record.listDiseasesJSON
end

MyApp.get "/api/diseases/:id" do
  content_type :json
  Record.listSymptomsJSON(params[:id].to_i)
end 

MyApp.get "/api/patient" do
  content_type :json
  name = params[:name]
  info = Record.apiReturn(name)
  info.to_json
end