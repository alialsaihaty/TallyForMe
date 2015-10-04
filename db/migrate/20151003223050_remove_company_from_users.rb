class RemoveCompanyFromUsers < ActiveRecord::Migration
  def change
    remove_reference(:users, :company, index: true, foreign_key: true)
  end
end
