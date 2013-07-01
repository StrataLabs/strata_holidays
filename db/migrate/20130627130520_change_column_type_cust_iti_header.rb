class ChangeColumnTypeCustItiHeader < ActiveRecord::Migration
  def change
    change_column :cust_iti_headers, :no_of_children, :integer
    # execute <<-SQL
    #   ALTER TABLE cust_iti_headers
    #   ALTER COLUMN no_of_children TYPE integer USING no_of_children::integer
    # SQL
  end
end