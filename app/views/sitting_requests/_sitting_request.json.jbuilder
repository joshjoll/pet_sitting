json.extract! sitting_request, :id, :user_id, :pet_name, :animal_id, :drop_off, :pickup, :request_status, :cost, :created_at, :updated_at
json.url sitting_request_url(sitting_request, format: :json)
