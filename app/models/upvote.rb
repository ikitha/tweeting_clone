class Upvote < ApplicationRecord
  belongs_to :alarm

  validates :alarm, presence: true
  before_save :increment_vote_count

  def increment_vote_count
    self.vote_count.nil? ?  self.vote_count = 1 : self.vote_count += 1
  end
end
