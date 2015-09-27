class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :unit
      t.integer :tax1
      t.integer :tax2
      t.text :description
      t.decimal :cost

      t.timestamps null: false
    end
  end
end
