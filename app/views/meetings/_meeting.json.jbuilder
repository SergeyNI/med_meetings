json.extract! meeting, :id, :user_id, :doctor_id, :time_begin, :suggestion, :created_at, :updated_at
json.url meeting_url(meeting, format: :json)
