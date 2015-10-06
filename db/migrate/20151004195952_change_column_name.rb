class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :clients, :first_name, :business_name
  end
end
