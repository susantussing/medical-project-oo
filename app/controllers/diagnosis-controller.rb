MyApp.get "/" do
  erb :"diagnosis/home"
end

MyApp.post "/diagnosis/" do
  if params[:name]
    session.clear
    session['name'] = params[:name] 
  end
  session['question'] ||= 0
  session['answer'] = params[:answer]
  @answer = session['answer']
  @answers = session['answers'] || []
  @question = session['question']
  if @answer == "yes"
    @answers[@question] = true
  elsif @answer == "no"
    @answers[@question] = false
  end
  @next = Diagnosis.next_question(@answers)
  session['answers'] = @answers
  if @next == nil
    redirect "/diagnosis/result"
  else
    session['question'] = @next
    redirect "/diagnosis/quiz"
  end
end

MyApp.get "/diagnosis/quiz" do
  @name = session['name']
  @answer = session['answer']
  @answers = session['answers'] 
  @question = session['question']

  @question_text = Diagnosis.questions[@question]

  erb :"diagnosis/quiz"
end

MyApp.get "/diagnosis/result" do
  @name = session['name']
  @answers = session['answers'] 
  @diagnosis = Diagnosis.diagnose(@answers)
  erb :"diagnosis/result"
end