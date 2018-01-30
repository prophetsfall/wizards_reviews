class WizardShowSerializer < ActiveModel::Serializer
  attributes :id, :creator_id, :name, :description, :img_url, :average_rating, :user_reviews

  has_many :reviews

  def user_reviews
    # We can now access the current_user with the keyword `scope`
    object.reviews.where(user: scope)
  end
end
