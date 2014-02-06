class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :strnum, :limit => 10
      t.string :addr1, :limit => 25
      t.string :addr2, :limit => 25
      t.string :city, :limit => 25
      t.string :state, :limit => 2
      t.string :zip, :limit => 5
      t.string :presort, :limit => 4
      t.integer :patient_id
      t.integer :emer_contact_id
      t.integer :pharmacy_id
      t.integer :ins_company_id

      t.timestamps
    end
  end
end
