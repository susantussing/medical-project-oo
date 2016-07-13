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
  erb :"records/delete"
end