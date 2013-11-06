class CreateVcPromotionMailers < ActiveRecord::Migration
  def change
    create_table :vc_promotion_mailers do |t|
      t.string :subject
      t.text :content
      t.integer :vacation_consultant_id

      t.timestamps
    end
  end
end
