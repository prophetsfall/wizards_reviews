class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :wizard_id, :body, :rating, :created_at
end
