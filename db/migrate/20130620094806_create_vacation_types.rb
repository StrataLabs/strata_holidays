class CreateVacationTypes < ActiveRecord::Migration
  def change
    create_table :vacation_types do |t|
      t.string :vac_type

      t.timestamps
    end
  end
end
