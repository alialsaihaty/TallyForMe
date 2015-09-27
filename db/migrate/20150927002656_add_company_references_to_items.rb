class AddCompanyReferencesToItems < ActiveRecord::Migration
  def change
    add_reference :items, :company, index: true, foreign_key: true
  end
end
