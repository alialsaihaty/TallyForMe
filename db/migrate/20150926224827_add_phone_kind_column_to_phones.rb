class AddPhoneKindColumnToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :phone_kind, :string
  end
end
