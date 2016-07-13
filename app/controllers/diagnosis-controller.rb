MyApp.get "/" do
  erb :"diagnosis/home"
end

MyApp.post "/diagnosis/" do
  session['name'] = params[:name] || session['name']
  session['answer'] = params[:answer]
  redirect "/diagnosis/quiz"
end

MyApp.get "/diagnosis/quiz" do
  @name = session['name']
  @answer = session['answer']
  @question = Diagnosis.questions[0]
  erb :"diagnosis/quiz"
end