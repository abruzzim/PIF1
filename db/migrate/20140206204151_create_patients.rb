class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :fname, :limit => 25, :null => false
      t.string :lname, :limit => 25, :null => false
      t.date :dob, :null => false
      t.string :gender, :limit => 1, :null => false
      t.string :ssn, :limit => 9
      t.string :race, :limit => 25
      t.string :ethnicity, :limit => 25

      t.timestamps
    end
  end
end
