class Diagnosis
  def self.symptoms
    # stores the list of questions to be asked
    symptoms = [
      ["Cough", "Do you have a cough?"],
      ["Fever", "Do you have a fever?"],
      ["Headache", "Do you have a headache?"],
      ["Rash", "Do you have a rash?"],
      ["Nausea", "Are you nauseous?"],
      ["Runny Nose", "Do you have a runny nose?"],
      ["Hair Loss", "Are you losing your hair?"]
    ]
  end

  def self.diseases
    diseases = [
      ["Lung Cancer", [0, 2]],
      ["Skin Cancer", [1, 3, 4]],
    ]
  end

  def self.default
    default = "some kind of cancer"
  end

  def Diagnosis.next_question(answers)
    # takes an array of the current answers
    # check for diagnosis should occur before calling this

    return answers.length
      
  end

  def Diagnosis.diagnose(answers)

    Diagnosis.diseases.each do |disease|
      # for each disease, check to see if all symptoms are true
      diag = true
      while diag == true
        disease[1].each do |i|
          # If this symptom is not present, this isn't the right diagnosis.
          if !answers[i]
            diag = false
          end
        end
        # If all symptoms are present, we have a diagnosis.
        if diag
          return disease[0]
        end
      end
    end
    # if no official diagnosis but all questions answered, return default
    if answers.length == Diagnosis.symptoms.length
      return Diagnosis.default
    end

  end

end