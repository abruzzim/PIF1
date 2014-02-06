class CreateEmerContacts < ActiveRecord::Migration
  def change
    create_table :emer_contacts do |t|
      t.string :fname, :limit => 25
      t.string :lname, :limit => 25
      t.integer :patient_id

      t.timestamps
    end
  end
end
