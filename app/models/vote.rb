class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :review

  validates :user, presence: true
  validates :review, presence: true
  validates :vote, inclusion: {in: [-1, 0, 1]}

  validate :unique_vote
  def unique_vote
    if !Vote.where({user: user, review: review}).length == 0
      errors.add(:user, "You have already voted")
    end
  end
end