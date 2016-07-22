MyApp.post "/records/list" do
  session['name'] = params[:name]
  redirect "/records/list"
end

MyApp.get "/records/list" do
  @name = session['name']
  erb :"records/list"
end

MyApp.post "/records/delete" do
  session['name'] = params[:name]
  redirect "/records/delete"
end

MyApp.get "/records/delete" do
  @name = session['name']
  Record.deleteRecords(@name)
  erb :"records/delete"
end

MyApp.get "/records/save" do
  @name = session['name']
  @answers = session['answers'] 
  @diagnosis = Diagnosis.diagnose(@answers)
  Record.saveRecord(@name, @diagnosis)
  erb :"records/save"
end

MyApp.get "/api/patient" do
  name = params[:name]
  info = Record.apiReturn(name)
  info.to_json
end