class Diagnosis
  def self.questions
    # stores the list of questions to be asked
    questions = [
      "0",
      "1",
      "2"
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
end