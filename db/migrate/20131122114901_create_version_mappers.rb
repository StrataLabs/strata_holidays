class CreateVersionMappers < ActiveRecord::Migration
  def change
    create_table :version_mappers do |t|
      t.integer :value
      t.string :children
      t.string :modeltype
      t.integer :model_id

      t.timestamps
    end
  end
end
