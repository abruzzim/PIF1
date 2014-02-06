class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.string :areacode, :limit => 3
      t.string :prefix, :limit => 3
      t.string :number, :limit => 4
      t.string :extension, :limit => 5
      t.integer :patient_id
      t.integer :emer_contact_id
      t.integer :pharmacy_id
      t.integer :ins_company_id

      t.timestamps
    end
  end
end
