class AddAddressKindColumnToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :address_kind, :string
  end
end
