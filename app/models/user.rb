# CREATE TABLE users
# (
# id INTEGER PRIMARY KEY,
# name TEXT
# );


class User
  include InstanceMethodsORM
  extend ClassMethodsORM
  attr_reader :name, :id

  def initialize(hash=nil)
    @id = hash["id"]
    @name = hash["name"]
    if @id.nil?
      save
    end
  end

end