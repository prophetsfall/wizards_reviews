class Wizard < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :magic_school

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  mount_uploader :img_url, ImgUrlUploader

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
