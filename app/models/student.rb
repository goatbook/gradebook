class Student < ActiveRecord::Base
  has_secure_password
  has_many :grades
  has_many :parents
  belongs_to :teacher


  def self.all_students
    return self.all
  end
end
