class RemoveUserFromClients < ActiveRecord::Migration
  def change
    remove_reference(:clients, :user, index: true, foreign_key: true)
  end
end
