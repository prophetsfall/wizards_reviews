class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :wizard_id, :body, :rating, :created_at, :creator_name, :creator_img
  def creator_name
    object.user.user_name
  end

  def creator_img
    object.user.profile_photo
  end
end
