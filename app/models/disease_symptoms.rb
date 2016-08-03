# CREATE TABLE disease_symptoms
# (
#   id INTEGER PRIMARY KEY,
#   disease_id INTEGER,
#   symptom_id INTEGER
# );
# INSERT INTO disease_symptoms (disease_id, symptom_id)
# VALUES
# (1, 1),
# (1, 4),
# (2, 1),
# (2, 5),
# (3, 2),
# (3, 4),
# (4, 2),
# (4, 7),
# (5, 6),
# (6, 3),
# (6, 4);

class Disease_Symptom
  include InstanceMethodsORM
  extend ClassMethodsORM
  attr_reader :symptom_id, :disease_id

  def initialize(hash)
    @disease_id = hash["disease_id"]
    @symptom_id = hash["symptom_id"]
  end

  def obj
    Symptom.find(@symptom_id)
  end

end