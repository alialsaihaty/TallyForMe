class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :phone_number
      t.string :country_code
      t.string :ext
      t.string :is_default
      t.string :mobile
      t.references :phonable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
