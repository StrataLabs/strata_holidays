class PatchForPoaType < ActiveRecord::Migration
  def change
    if PoaType.column_names.include? "poa_type"
      poas = PoaType.all
      poas.each do |poa|
        poa.description = poa.poa_type
        poa.save
      end
      remove_column :poa_types, :poa_type
    end
  end
end
