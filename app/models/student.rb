class Student < ActiveRecord::Base
  has_secure_password
  has_many :grades
  has_many :parents
  belongs_to :teacher


  def self.all_students
    students = []
    self.all.each do |i|
      students << i.name
    end
  end
end
