require 'test_helper'

class recordTest < Minitest::Test
  def setup
    super
    
    # This setup will automatically be run before each test below.
  end

  # Your tests are defined here. Tests must be contained in a method
  # that begins with test_ or it won't work. An example test:

  def test_questions
    assert_equal(Record.getQuestion([true, nil,nil,nil,nil,nil]), "Cough;")
    assert_equal(Record.getQuestion([false, true,nil,nil,nil,nil]), "Productive Cough;")
    assert_equal(Record.getQuestion([false, false, true]), "Headache;")
    assert_equal(Record.getQuestion([false false, false, true]), "Headache on one side;")
    assert_equal(Record.getQuestion([false, false, nil, nil, true]), "Rash;")
    assert_equal(Record.getQuestion([false, false, nil,nil,nil,true]), "Rash on face;")
  end
end