class CreateInsCompanies < ActiveRecord::Migration
  def change
    create_table :ins_companies do |t|
      t.string :name, :limit => 50
      t.string :mbrfname, :limit => 25
      t.string :mbrlname, :limit => 25
      t.string :mbrid, :limit => 25
      t.string :grpnum, :limit => 25
      t.string :relationship, :limit => 25
      t.integer :patient_id

      t.timestamps
    end
  end
end
