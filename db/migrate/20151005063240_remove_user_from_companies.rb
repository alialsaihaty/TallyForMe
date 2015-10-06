class RemoveUserFromCompanies < ActiveRecord::Migration
  def change
    remove_reference(:companies, :user, index: true, foreign_key: true)
  end
end
