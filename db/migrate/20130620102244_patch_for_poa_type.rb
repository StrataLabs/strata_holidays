class PatchForPoaType < ActiveRecord::Migration
  def change
    if PoaType.column_names.include? "description"
      poas = PoaType.all
      poas.each do |poa|
        poa.poa_type = poa.description
        poa.save
      end
      remove_column :poa_types, :description
    end
  end
end
