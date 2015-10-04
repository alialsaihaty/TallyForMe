class AddCompanyToAddresses < ActiveRecord::Migration
  def change
    add_reference :addresses, :company, index: true, foreign_key: true
  end
end
