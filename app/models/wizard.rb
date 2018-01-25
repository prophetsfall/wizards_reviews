class Wizard < ApplicationRecord
  has_many :reviews

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  def to_param
    return self.name
  end
end
