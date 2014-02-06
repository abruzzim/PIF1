class CreateSignatures < ActiveRecord::Migration
  def change
    create_table :signatures do |t|
      t.boolean :approved, :default => false
      t.integer :patient_id

      t.timestamps
    end
  end
end
