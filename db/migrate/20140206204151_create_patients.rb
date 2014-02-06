class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :fname, :limit => 25
      t.string :lname, :limit => 25
      t.date :dob
      t.string :gender, :limit => 1
      t.string :ssn, :limit => 9
      t.string :race, :limit => 25
      t.string :ethnicity, :limit => 25

      t.timestamps
    end
  end
end
