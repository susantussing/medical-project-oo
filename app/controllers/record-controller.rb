MyApp.post "/records/list" do
  session['name'] = params[:name]
  redirect "/records/list"
end

MyApp.get "/records/list" do
  @name = session['name']
  erb :"records/list"
end