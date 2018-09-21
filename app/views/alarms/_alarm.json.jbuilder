json.extract! alarm, :id, :message, :created_at, :updated_at
json.vote_count alarm.upvotes.present? ? alarm.upvotes.first.vote_count : 0
json.url alarm_url(alarm, format: :json)
