require 'test_helper'

class RecordTest < Minitest::Test
  def setup
    super
    Record.setHistory("testrun.txt")
    # This setup will automatically be run before each test below.
  end

end