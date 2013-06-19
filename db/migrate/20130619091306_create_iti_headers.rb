class CreateItiHeaders < ActiveRecord::Migration
  def change
    create_table :iti_headers do |t|
      t.string :name
      t.string :iti_type
      t.integer :vacation_type_id
      t.date :iti_start_date
      t.date :iti_end_date
      t.string :season
      t.integer :duration
      t.integer :no_of_people

      t.timestamps
    end
  end
end
