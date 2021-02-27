json.extract! task, :id, :title, :description, :deliver_date, :status, :user_id, :created_at, :updated_at
json.url task_url(task, format: :json)
