class CreatePharmacies < ActiveRecord::Migration
  def change
    create_table :pharmacies do |t|
      t.string :name, :limit => 50
      t.integer :patient_id

      t.timestamps
    end
  end
end
