require 'test_helper'
require 'json'

class RecordTest < Minitest::Test
  def setup
    super
    Record.setHistory("testrun.txt")
    # This setup will automatically be run before each test below.
  end

  def test_listdiseases
    assert_equal(Record.listDiseases.length, 4)
  end

  def test_listdiseasesJSON
    result = JSON.parse(Record.listDiseasesJSON)
    disease = result["diseases"][0]
    assert_equal(disease, {
      "id" => 0,
      "name" => "Lung Cancer",
      "symptoms" => ["Cough", "Headache"]
    })
  end

  def test_listsymptomsJSON
    result = JSON.parse(Record.listSymptomsJSON(0))
    assert_equal(result,{
      "id" => 0,
      "disease" => "Lung Cancer",
      "symptoms" => ["Cough", "Headache"]
      })
  end
end