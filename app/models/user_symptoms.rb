# CREATE TABLE user_symptoms
# (
#   id INTEGER PRIMARY KEY,
#   user_id INTEGER,
#   symptom_id INTEGER
# );

class User_Symptom
  include InstanceMethodsORM
  extend ClassMethodsORM
  attr_reader :id, :symptom_id, :disease_id

  def initialize(hash)
    @id = hash["id"]
    @user_id = hash["user_id"]
    @symptom_id = hash["symptom_id"]

    if @id.nil?
      save
    end
  end

  def obj
    Symptom.find(@symptom_id)
  end

end