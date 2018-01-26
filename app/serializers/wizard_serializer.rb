class WizardSerializer < ActiveModel::Serializer
  attributes :id, :name, :img_url, :created_at, :average_rating
  has_many :reviews

  def average_rating
    sum = 0
    if object.reviews.length >0
      object.reviews.each do|review|
        sum += review.rating
      end
      sum/object.reviews.length
    else
      "No Reviews"
    end
  end
end
