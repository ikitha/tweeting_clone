require 'rails_helper'
require 'spec_helper'

RSpec.describe UpvotesController, type: :request do
  let!(:alarm_1) { FactoryBot.create(:alarm) }
  let!(:alarm_2) { FactoryBot.create(:alarm) }

describe "POST upvote" do

    it "Creates an upvote for an alarm and sets vote count to 1" do

      post "/alarms/#{alarm_1.id}/upvotes.json"

      res = JSON.parse(response.body)

      expect(res["message"]).to eq alarm_1.message.upcase
      expect(res["vote_count"]).to eq 1
    end

    it "Creates an upvote for an alarm and sets vote count to 2 if posted twice" do

      post "/alarms/#{alarm_2.id}/upvotes.json"

      post "/alarms/#{alarm_2.id}/upvotes.json"

      res = JSON.parse(response.body)

      expect(res["message"]).to eq alarm_2.message.upcase
      expect(res["vote_count"]).to eq 2
    end
  end
end
