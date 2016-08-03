# CREATE TABLE symptoms
# (
# id INTEGER PRIMARY KEY,
# name TEXT,
# question TEXT
# );


#
# INSERT INTO symptoms (name, question)
# VALUES
# ("cough","Do you have a cough?"),
# ("headache","Do you have a headache?"),
# ("rash","Do you have a rash?"),
# ("fatigue","Are you feeling tired or run down?"),
# ("fever", "Are you running a fever?"),
# ("growth", "Do you have any abnormal growths or moles on your skin?"),
# ("aura", "Do you have visual disturbances or see an aura around objects?");


class Symptom
  include InstanceMethodsORM
  extend ClassMethodsORM
  attr_reader :name, :id

  def initialize(hash)
    @id = hash["id"]
    @name = hash["name"]
  end
end