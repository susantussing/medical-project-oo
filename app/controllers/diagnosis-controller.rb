MyApp.get "/" do
  erb :"diagnosis/home"
end

MyApp.post "/signin" do
  user_hash = {"name" => params[:name]}
  @user = User.where(user_hash)[0] || User.new(user_hash)
  session['user_id'] = @user.id

  erb :"diagnosis/start"
end

MyApp.route :get, :post, "/diagnosis" do
  @user = User.find(session['user_id'])
  @symptom = Symptom.find(session['symptom'] || 1)
  @question_text = @symptom.question
  session['symptom'] = @symptom.id + 1
  erb :"diagnosis/quiz"
end