json.extract! time_sheet, :id, :clock_in, :started, :created_at, :updated_at
json.url time_sheet_url(time_sheet, format: :json)
