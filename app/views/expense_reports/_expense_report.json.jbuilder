json.extract! expense_report, :id, :title, :date, :items, :approved, :created_at, :updated_at
json.url expense_report_url(expense_report, format: :json)
