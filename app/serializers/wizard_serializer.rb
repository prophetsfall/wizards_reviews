class WizardSerializer < ActiveModel::Serializer
  attributes :id, :name, :img_url, :created_at, :average_rating
  # has_many :reviews


end
