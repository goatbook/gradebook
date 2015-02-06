class Student < ActiveRecord::Base
  has_many :grades
  has_many :parents
  belongs_to :teacher
end
