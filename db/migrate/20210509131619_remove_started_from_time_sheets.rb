class RemoveStartedFromTimeSheets < ActiveRecord::Migration[6.1]
  def change
    remove_column :time_sheets, :started, :boolean
  end
end
