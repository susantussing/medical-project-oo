class Diagnosis

  def self.default
    default = "some kind of cancer"
  end

  def Diagnosis.next_question(answers)
    # takes an array of the current answers
    # check for diagnosis should occur before calling this
    next_question = answers.length
    if answers.length >= Record.numSymptoms || Diagnosis.diagnose(answers)
      return nil
    end
    return answers.length
      
  end

  def Diagnosis.diagnose(answers)
    symptoms = answers.map.with_index { |a, i| a ? i : nil}.compact
    disease = Record.getDisease(Record.findDisease(symptoms))
    if disease.nil? && answers.length == Record.numSymptoms
      disease = Diagnosis.default
    end
    return disease
  end

end