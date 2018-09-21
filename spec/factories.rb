FactoryBot.define do
  factory :alarm do
    message { Faker::BojackHorseman.tongue_twister }
  end

  factory :upvote do
    alarm
    count nil
  end
end
