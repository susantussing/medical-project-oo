require 'test_helper'

class DiagnosisTest < Minitest::Test
  def setup
    # This setup will automatically be run before each test below.

    DB.execute("DELETE FROM diagnoses")
  end

  # Your tests are defined here. Tests must be contained in a method
  # that begins with test_ or it won't work. An example test:

  def test_add_diagnosis
    now = Time.now.to_i
    hash = {"user_id" => 1, "disease_id" => 1, "time" => now}
    diagnosis = Diagnosis.new(hash)
    assert_equal(diagnosis.time, now)
    assert_equal(diagnosis.disease.class, Disease)
  end

  def test_diagnose
    user_id = 1
    cough = Symptom.find(1)
    headache = Symptom.find(2)
    fatigue = Symptom.find(4)
    symptoms = [cough, headache, fatigue]
    diagnoses = Diagnosis.diagnose(user_id, symptoms)
    assert_equal(diagnoses[0].disease.name, "lung cancer")
  end
end