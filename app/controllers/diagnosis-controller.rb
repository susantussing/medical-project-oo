MyApp.get "/" do
  erb :"diagnosis/home"
end

MyApp.post "/signin" do
  user_hash = {"name" => params[:name]}
  @user = User.where(user_hash)[0] || User.new(user_hash)
  @user.clear_symptoms
  session['user_id'] = @user.id
  session['symptom'] = 1

  erb :"diagnosis/start"
end

MyApp.route :get, :post, "/diagnosis" do
  @user = User.find(session['user_id'])
  @symptom = Symptom.find(session['symptom'])
  if params['answer'] == "yes"
    @user.add_symptom(Symptom.find(@symptom.id - 1))
  end
  @question_text = @symptom.question
  session['symptom'] = @symptom.id + 1

  # if the current symptoms present a diagnosis, redirect
  # otherwise
  erb :"diagnosis/quiz"
end