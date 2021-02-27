json.extract! session, :id, :start, :end, :pause, :keys, :backspace, :last_key, :task_id, :created_at, :updated_at
json.url session_url(session, format: :json)
