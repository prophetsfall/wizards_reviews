class Review < ApplicationRecord
  belongs_to :user
  belongs_to :wizard
  has_many :votes
  validates :body, presence: true
  validates :rating, presence: true, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 100
    }
    def vote_count
      sum = 0
      self.votes.each do |vote|
        sum += vote.vote.to_i
      end
      sum
    end
end
