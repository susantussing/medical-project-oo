require 'test_helper'

class UserTest < Minitest::Test
  def setup
    super

    # Remove all users from test database before running each test
    DB.execute("DELETE FROM users")
  end

  # Your tests are defined here. Tests must be contained in a method
  # that begins with test_ or it won't work. An example test:

  def test_user_save
    # If we create a new user with the name Jane, she should have an ID of 1.
    hash = {"name" => "Jane"}
    user = User.new(hash)
    assert_equal(user.id, 1)
    assert_equal(user.name, "Jane")
  end

  def test_user_delete
    # After deleting a user, we shouldn't be able to find their ID.
    hash = {"name" => "Jane"}
    user = User.new(hash)
    id = user.id
    user.delete
    assert_equal(User.find(id), nil)
  end

  def test_user_find
    # Create a user who'll be assigned the ID of 1.  Find that user.
    hash = {"name" => "Jane"}
    user = User.new(hash)
    user2 = User.find(1)
    assert_equal(user2.id, 1)
    # There shouldn't be any user with the ID of 999.
    user3 = User.find(999)
    assert_equal(user3, nil)
  end

  def test_user_where
    hash = {"name" => "Jane"}
    user = User.new(hash)
    user2 = User.where(hash)[0]
    assert_equal(user2.name, "Jane")
  end

  def test_user_all
    names = ["Alice", "Bob", "Carlos", "Diana"]

    names.each do |name|
      User.new({"name" => name})
    end

    all = User.all

    assert_equal(all.length, 4)
    assert_equal(all[0].name, "Alice")
  end

end