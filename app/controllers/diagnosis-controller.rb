MyApp.get "/" do
  erb :"diagnosis/home"
end

MyApp.post "/diagnosis/" do
  # If we start again from entering the name, reset the session.
  if params[:name]
    session.clear
    session['name'] = params[:name] 
  end

  # If there's no previous question, start at the beginning.
  session['question'] ||= 0

  session['answer'] = params[:answer]
  
  # Load variables from the session.
  @answer = session['answer']
  @answers = session['answers'] || []
  @question = session['question']
  
  # Set the current answer if there is one.
  if @answer == "yes"
    @answers[@question] = true
  elsif @answer == "no"
    @answers[@question] = false
  end

  # Save the current answers.
  session['answers'] = @answers
  
  # Find the next question.
  @next = Diagnosis.next_question(@answers)

  # If we have a diagnosis, redirect to results page.
  # Otherwise, redirect to the next quiz question.
  if Diagnosis.diagnose(@answers)
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

  @question_text = Diagnosis.symptoms[@question][1]

  erb :"diagnosis/quiz"
end

MyApp.get "/diagnosis/result" do
  @name = session['name']
  @answers = session['answers'] 
  @diagnosis = Diagnosis.diagnose(@answers)
  erb :"diagnosis/result"
end