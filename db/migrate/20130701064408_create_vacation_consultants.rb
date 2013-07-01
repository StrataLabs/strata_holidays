class CreateVacationConsultants < ActiveRecord::Migration
  def change
    create_table :vacation_consultants do |t|
      t.string :name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :country
      t.string :lphone
      t.string :mphone
      t.string :email
      t.string :comments

      t.timestamps
    end
  end
end
