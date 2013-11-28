class CreateUserResponses < ActiveRecord::Migration
  def change
    create_table :user_responses do |t|
      t.string :name
      t.string :email
      t.string :contact_no
      t.date :start_date
      t.date :end_date
      t.integer :no_of_adults
      t.integer :no_of_children

      t.timestamps
    end
  end
end
