class WizardSerializer < ActiveModel::Serializer
  attributes :id, :name, :img_url, :description, :creator_id, :created_at
end
