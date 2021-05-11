class CreateTimeSheets < ActiveRecord::Migration[6.1]
  def change
    create_table :time_sheets do |t|
      t.datetime :clock_in
      t.boolean :started, default: false

      t.timestamps
    end
  end
end
