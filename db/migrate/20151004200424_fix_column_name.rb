class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :clients, :last_name, :client_name
  end
end
