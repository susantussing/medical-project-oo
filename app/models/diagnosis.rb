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

  def disease
    Disease.find(@disease_id)
  end

end