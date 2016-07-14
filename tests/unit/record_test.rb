require 'test_helper'

class RecordTest < Minitest::Test
  def setup
    super
    
    # This setup will automatically be run before each test below.
  end

  # Your tests are defined here. Tests must be contained in a method
  # that begins with test_ or it won't work. An example test:

  def test_getQuestion
    assert_equal(Record.getQuestion([true,nil,nil,nil,nil,nil]), "Cough;")
    assert_equal(Record.getQuestion([nil,true,nil,nil,nil,nil]), "Productive Cough;")
    assert_equal(Record.getQuestion([nil,nil,true,nil,nil,nil]), "Headache;")
    assert_equal(Record.getQuestion([nil,nil,nil,true,nil,nil]), "Headache on one side;")
    assert_equal(Record.getQuestion([nil,nil,nil,nil,true,nil]), "Rash;")
    assert_equal(Record.getQuestion([nil,nil,nil,nil,nil,true]), "Rash on face")
    assert_equal(Record.getQuestion([true,true,true,true,true,true]), "Cough;Productive Cough;Headache;Headache on one side;Rash;Rash on face")
  end

  def test_readwritedelete
  	Record.saveRecord("TestName",[true,true,true,true,true,true],"Disease")
  	result = Record.getRecords("TestName")
  	assert_equal(result[0][1][0], "Cough")
  	assert_equal(result[0][1][1], "Productive Cough")
  	assert_equal(result[0][1][2], "Headache")
  	assert_equal(result[0][1][3], "Headache on one side")
  	assert_equal(result[0][1][4], "Rash")
  	assert_equal(result[0][1][5], "Rash on face")
  	Record.deleteRecords("TestName")
  	result = Record.getRecords("TestName")
  	empty = []
  	assert_equal(result, empty)
  end
end