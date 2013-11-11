class FixColumnNameInVcAssignment < ActiveRecord::Migration
  def change
    rename_column :vc_assignments, :status, :state
  end
end
