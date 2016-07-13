class Diagnosis
  def self.questions
    # stores the list of questions to be asked
    questions = [
      "Do you have a cough?",
      "Is it productive?",
      "Do you have a headache?",
      "Is your headache located primarily on one side of the head?",
      "Do you have a rash?",
      "Is the rash on your face?"
    ]
  end

  def Diagnosis.next_question(answers)
    # takes an array with six values for the six questions

    if answers[0] == true
      if answers[1] != nil
        return nil
      else
        return 1
      end
    elsif answers[0] == false
      if answers[2] == true
        if answers[3] != nil
          return nil
        else
          return 3
        end
      elsif answers[2] == false
        if answers[4] == true
          if answers[5] != nil
            return nil
          else
            return 5
          end
        elsif answers[4] == false
          return nil
        elsif answers[4] == nil
          return 4
        end
      elsif answers[2] == nil
        return 2
      end
    elsif answers[0] == nil
      return 0
    end

  end

  def Diagnosis.diagnose(answers)

    case 
    when answers[1] == true
      return "pneumonia"
    when answers[1] == false
      return "lung cancer"
    when answers[3] == true
      return "migraine"
    when answers[3] == false
      return "brain cancer"
    when answers[5] == true
      return "lupus"
    when answers[5] == false
      return "skin cancer"
    when answers[0] == false && answers[2] == false && answers[4] == false
      return "still cancer"
    end

  end
end