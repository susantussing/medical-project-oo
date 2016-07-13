MyApp.get "/" do
  erb :"diagnosis/home"
end

MyApp.post "/diagnosis/" do
  session['name'] = params[:name]
  redirect "/diagnosis/quiz"
end

MyApp.get "/diagnosis/quiz" do
  @name = session['name']
  erb :"diagnosis/quiz"
end