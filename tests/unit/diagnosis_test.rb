require 'test_helper'

class DiagnosisTest < Minitest::Test
  def setup
    @answers = []
    # This setup will automatically be run before each test below.
  end

  # Your tests are defined here. Tests must be contained in a method
  # that begins with test_ or it won't work. An example test:

  def test_question_cough
    # If there's no answer to 0, it should be 0.
    assert_equal(Diagnosis.next_question([nil, nil, nil, nil, nil, nil]), 0)
    # If 0 is false, the next question is 2.
    assert_equal(Diagnosis.next_question([false, nil, nil, nil, nil, nil]), 2)
    # If 0 is true, but 1 is nil, the next question is 1.
    assert_equal(Diagnosis.next_question([true, nil, nil, nil, nil,  nil]), 1)
    # If 0 is true, and 1 is not nil, there is no next question.
    assert_equal(Diagnosis.next_question([true, true, nil, nil, nil, nil]), nil)
  end

  def test_question_headache
    # We shouldn't get here if there's no answer to 2 yet.
    # If 2 is false, the next question is 4.
    assert_equal(Diagnosis.next_question([false, nil, false, nil, nil, nil]), 4)
    # If 2 is true, and 3 is nil, the next question is 3.
    assert_equal(Diagnosis.next_question([false, nil, true, nil, nil, nil]), 3)
    # If 2 is true, and 3 is not nil, there is no next question.
    assert_equal(Diagnosis.next_question([false, nil, true, true, nil, nil]), nil)
  end

  def test_question_rash
    # We shouldn't get here if there's no answer to 4 yet.
    # If 4 is false, there is no next question.
    assert_equal(Diagnosis.next_question([false, nil, false, nil, false, nil]), nil)
    # If 4 is true, and 5 is nil, the next question is 5.
    assert_equal(Diagnosis.next_question([false, nil, false, nil, true, nil]), 5)
    # If 4 is true, and 5 is not nil, there is no next question.
    assert_equal(Diagnosis.next_question([false, nil, false, nil, true, true]), nil)
  end

  def test_diagnose_pneumonia
    @answers[1] = true
    assert_equal(Diagnosis.diagnose(@answers), "pneumonia")
  end

  def test_diagnose_lung_cancer
    @answers[1] = false
    assert_equal(Diagnosis.diagnose(@answers), "lung cancer")
  end

  def test_diagnose_migraine
    @answers[3] = true
    assert_equal(Diagnosis.diagnose(@answers), "migraine")
  end

  def test_diagnose_brain_cancer
    @answers[3] = false
    assert_equal(Diagnosis.diagnose(@answers), "brain cancer")
  end

  def test_diagnose_lupus
    @answers[5] = true
    assert_equal(Diagnosis.diagnose(@answers), "lupus")
  end

  def test_diagnose_skin_cancer
    @answers[5] = false
    assert_equal(Diagnosis.diagnose(@answers), "skin cancer")
  end
end