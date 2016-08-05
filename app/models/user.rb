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

  def symptoms
    user_symptoms.map{ |x| x.obj }
  end

  def user_symptoms
    User_Symptom.where({"user_id" => @id})
  end

  def add_symptom(symptom)
    User_Symptom.new({"user_id" => @id, "symptom_id" => symptom.id})
  end

  def clear_symptoms
    if user_symptoms.length >= 1
      user_symptoms.each { |x| x.delete }
    end
  end

end