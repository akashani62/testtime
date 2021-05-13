class AddUserToTimeSheets < ActiveRecord::Migration[6.1]
  def change
    # add_reference :time_sheets, :user, null: false, foreign_key: true
    add_reference :time_sheets, :user, foreign_key: true

  end
end
