class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.references :company, index: true, foreign_key: true
      t.string :first_name
      t.string :last_name

      t.timestamps null: false
    end
  end
end
