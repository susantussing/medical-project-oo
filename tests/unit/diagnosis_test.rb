require 'test_helper'

class DiagnosisTest < Minitest::Test
  def setup
    super
    
    # This setup will automatically be run before each test below.
  end

  # Your tests are defined here. Tests must be contained in a method
  # that begins with test_ or it won't work. An example test:

  def test_next_question
    assert_equal(Diagnosis.next_question([nil, nil, nil, nil, nil, nil]), 0)
    assert_equal(Diagnosis.next_question([true, nil, nil, nil, nil, nil]), 1)
    assert_equal(Diagnosis.next_question([false, nil, nil, nil, nil, nil]),2)
    assert_equal(Diagnosis.next_question([true, true, nil, nil, nil, nil]), nil)
  end

  def test_diagnose
    answers = []
    answers[1] = true
    assert_equal(Diagnosis.diagnose(answers), "pneumonia")
    answers = []
    answers[1] = false
    assert_equal(Diagnosis.diagnose(answers), "cancer")
  end
end