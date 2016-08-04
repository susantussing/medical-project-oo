# CREATE TABLE diagnoses
# (
#   id INTEGER PRIMARY KEY,
#   user_id INTEGER,
#   disease_id INTEGER,
#   time INTEGER
# );

# Needs to be required in the first class to load this because the alphabet, apparently.
require_relative 'instance_methods_orm'

class Diagnosis
  include InstanceMethodsORM
  extend ClassMethodsORM
  attr_reader :user_id, :diagnosis_id, :time

  # Of course this has a non-standard plural.
  # Override the table names for both the class and instances.
  def table
    "diagnoses"
  end

  def self.table
    "diagnoses"
  end

  def timestamp
    Time.at(@time)
  end

  def initialize(hash=nil)
    @id = hash["id"]
    @user_id = hash["user_id"]
    @disease_id = hash["disease_id"]
    @time = hash["time"]
    if @id.nil?
      save
    end
  end

  # Get the disease for this diagnosis.
  # 
  # Returns a Disease object.
  def disease
    Disease.find(@disease_id)
  end

  # Create a diagnosis if the symptoms match.
  #
  # symptoms - an array of symptom objects
  #
  # Returns an array of Diagnosis objects, or an empty array if none
  def self.diagnose(user_id, symptoms)
    now = Time.now.to_i
    symptom_ids = symptoms.map { |x| x.id }
    diagnoses = []
    Disease.all.each do |disease|
      disease_symptom_ids = disease.symptoms.map{|x| x.id}
      if disease_symptom_ids - symptom_ids == []
        diagnoses << Diagnosis.new({"user_id" => user_id, "disease_id" => disease.id, "time" => now})
      end
    end
    diagnoses
  end

end