require 'rails_helper'
require 'spec_helper'

RSpec.describe AlarmsController, type: :request do
  let!(:alarm_1) { FactoryBot.create(:alarm) }
  let!(:alarm_2) { FactoryBot.create(:alarm) }
  let(:alarm_params) {
     { message: "Sweet!" }
  }

  describe "GET index" do

    it "Gets alarms in descending order by creation" do

      get "/alarms.json"

      res = JSON.parse(response.body)

      expect(res.count).to eq 2
      expect(res[0]["created_at"] > res[1]["created_at"]).to be true
    end
  end

  describe "POST index" do

    it "Creates an alarm" do

      post "/alarms.json", params: { alarm: alarm_params }

      res = JSON.parse(response.body)

      expect(res["message"]).to eq "SWEET!"
    end
  end
end
