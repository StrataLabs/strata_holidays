class CreatePoaTypes < ActiveRecord::Migration
  def change
    create_table :poa_types do |t|
      t.string :poa_type
      t.string :description
      t.string :time_can_be_spent
      t.string :comments

      t.timestamps
    end
  end
end
