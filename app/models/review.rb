class Review < ApplicationRecord
  belongs_to :user
  belongs_to :wizard

  validates :body, presence: true
  validates :rating, presence: true, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 100
    }
end
