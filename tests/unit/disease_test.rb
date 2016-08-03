require 'test_helper'

class DiseaseTest < Minitest::Test
  def setup
    super
    
    # This setup will automatically be run before each test below.
  end

  # Your tests are defined here. Tests must be contained in a method
  # that begins with test_ or it won't work. An example test:

  def test_all_diseases
    diseases = Disease.all

    assert_equal(diseases.length, 6)
    assert_equal(diseases[0].class, Disease)
  end

  def test_disease_symptoms
    lung_cancer = Disease.find(1)

    lung_cancer.symptoms.each do |symptom|
      puts symptom.obj.name
    end
  end

end