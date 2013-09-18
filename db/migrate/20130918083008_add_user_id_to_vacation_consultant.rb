class AddUserIdToVacationConsultant < ActiveRecord::Migration
  def change
    add_column :vacation_consultants, :user_id, :integer
  end
end
