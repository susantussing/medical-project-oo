require 'test_helper'

class DiagnosisTest < Minitest::Test
  def setup
    @answers = []
    # This setup will automatically be run before each test below.
  end

  # Your tests are defined here. Tests must be contained in a method
  # that begins with test_ or it won't work. An example test:

  def test_lung_cancer
    @answers[0] = true
    @answers[2] = true
    assert_equal(Diagnosis.diagnose(@answers),"Lung Cancer")
  end

  def test_skin_cancer
    @answers[1] = true
    @answers[3] = true
    @answers[4] = true
    assert_equal(Diagnosis.diagnose(@answers),"Skin Cancer")
  end 

  def test_no_diagnosis_yet
    assert_nil(Diagnosis.diagnose(@answers))
  end

  def test_default_diagnosis
    @answers = [false, false, false, false, false, false, false]
    assert_equal(Diagnosis.diagnose(@answers), "some kind of cancer")
  end
end