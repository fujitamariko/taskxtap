json.extract! task, :id, :assortment, :major_category, :medium_category, :sub_category, :content, :plan_hours, :spend_hours, :deadline_on, :status, :created_at, :updated_at
json.url task_url(task, format: :json)
