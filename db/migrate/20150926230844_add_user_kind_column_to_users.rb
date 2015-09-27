class AddUserKindColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_kind, :string
  end
end
