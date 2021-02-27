json.extract! work_session, :id, :start, :end, :pause, :keys, :backspace, :last_key, :task_id, :created_at, :updated_at
json.url work_session_url(work_session, format: :json)
