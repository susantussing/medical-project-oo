# CREATE TABLE diseases
# (
# id INTEGER PRIMARY KEY,
# name TEXT
# );
#
#
# INSERT INTO diseases (name)
# VALUES
# ("lung cancer"),
# ("pneumonia"),
# ("brain cancer"),
# ("migraine"),
# ("skin cancer"),
# ("lupus");

# For some reason necessary in this class.
require_relative 'instance_methods_orm'

class Disease
  include InstanceMethodsORM
  extend ClassMethodsORM
  attr_reader :name, :id

  def initialize(hash)
    @id = hash["id"]
    @name = hash["name"]
  end

  def symptoms
    Disease_Symptom.where({"disease_id" => @id})
  end

end