class AddClockOutToTimeSheets < ActiveRecord::Migration[6.1]
  def change
    add_column :time_sheets, :clock_out, :datetime
  end
end
