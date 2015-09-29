class AddCompanyReferencesToServices < ActiveRecord::Migration
  def change
    add_reference :services, :company, index: true, foreign_key: true
  end
end
