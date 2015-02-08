class Parent < ActiveRecord::Base
  has_secure_password
  belongs_to :student

  validates :email, presence: true
  def self.all_parents
    return self.all
  end
end
