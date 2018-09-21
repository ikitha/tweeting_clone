class Alarm < ApplicationRecord
  has_one :upvote, dependent: :destroy

  validates :message, presence: true
  before_save :upcase_message
  after_create :push_message

  BELLBIRD_WEBHOOK = "https://bellbird.joinhandshake-internal.com/push"

  def upcase_message
    self.message = self.message.upcase
  end

  def push_message
    url = BELLBIRD_WEBHOOK
    headers = { 'Content-Type' => 'application/json' }
    res = APIService.new(url).post_request(headers, { alarm_id: self.id })
  end
end
