class CreateDestinationsVacationConsultants < ActiveRecord::Migration
  def change
    create_table :destinations_vacation_consultants do |t|
      t.integer :vacation_consultant_id
      t.integer :destination_id

      t.timestamps
    end
  end
end
