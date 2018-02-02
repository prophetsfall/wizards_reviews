class WizardShowSerializer < ActiveModel::Serializer
  attributes :id, :creator_id, :name, :description, :image_path, :average_rating, :user_reviews, :user

  has_many :reviews
  belongs_to :magic_school

  def user_reviews
    # We can now access the current_user with the keyword `scope`
    object.reviews.where(user: scope)
  end
  def image_path
    object.img_url.url
  end

  def user
    current_user
  end

end
