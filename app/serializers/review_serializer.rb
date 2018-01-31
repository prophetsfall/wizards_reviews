class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :wizard_id, :body, :rating, :created_at, :creator_name, :creator_img
  def creator_name
    if object.user
      object.user.user_name
    else
      "User no longer exists"
    end
  end

  def creator_img
    if object.user
    object.user.profile_photo
  else
  end
    "User no longer exists"
  end
end
