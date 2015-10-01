class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :email
      t.string :is_default
      t.string :email_kind
      t.references :emailable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
