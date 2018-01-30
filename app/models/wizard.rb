class Wizard < ApplicationRecord
  has_many :reviews

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  def to_param
    return self.name
  end

  def average_rating
    sum = 0
    if self.reviews.length >0
      self.reviews.each do|review|
        sum += review.rating
      end
      sum/self.reviews.length
    else
      "No Reviews"
    end
  end
end
