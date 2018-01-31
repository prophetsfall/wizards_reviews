class MagicSchool < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :wizards
end
