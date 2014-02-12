class CreateEmailAddresses < ActiveRecord::Migration
  def change
    create_table :email_addresses do |t|
      t.string :email, :limit => 50
      t.string :emtype, :limit => 25
      t.integer :patient_id
      t.integer :emer_contact_id

      t.timestamps
    end
  end
end
