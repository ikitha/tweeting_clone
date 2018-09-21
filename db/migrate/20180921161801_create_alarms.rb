class CreateAlarms < ActiveRecord::Migration[5.2]
  def change
    create_table :alarms do |t|
      t.string :message

      t.timestamps
    end
  end
end
