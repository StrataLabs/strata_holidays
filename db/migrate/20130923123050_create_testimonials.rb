class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.integer :vacation_consultant_id
      t.text :content
      t.integer :customer_id

      t.timestamps
    end
  end
end
