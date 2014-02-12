# == Schema Information
# Schema version: 20140206204214
#
# Table name: patients
#
# create_table "patients", :force => true do |t|
#   t.string   "fname",      :limit => 25, :null => false
#   t.string   "lname",      :limit => 25, :null => false
#   t.date     "dob",                      :null => false
#   t.string   "gender",     :limit => 1,  :null => false
#   t.string   "ssn",        :limit => 9
#   t.string   "race",       :limit => 25
#   t.string   "ethnicity",  :limit => 25
#   t.datetime "created_at",               :null => false
#   t.datetime "updated_at",               :null => false
# end


class Patient < ActiveRecord::Base
  attr_accessible :dob, :ethnicity, :fname, :gender, :lname, :race, :ssn

  # http://guides.rubyonrails.org/v3.2.14/association_basics.html
  # PhoneNumber will have a foreign key that refers to instances of Patient
  has_many :phone_numbers,  :autosave => true, 
                            :dependent => :destroy, 
                            :before_add => :before_add_method,
                            :after_add => :after_add_method,
                            :before_remove => :before_remove_method,
                            :after_remove => :after_remove_method

  validates :fname,  presence: true
  validates :lname,  presence: true
  validates :dob,    presence: true
  validates :gender, presence: true

  def name
    [fname, lname].join(' ')
  end

  def self.by_letter(letter)
    where("lname LIKE ?", "#{letter}%").order(:lname)
  end

  def before_add_method(phone_number)
    puts "%PATIENT-I-BEFORE_ADD, phone_number association callback called."
  end

  def after_add_method(phone_number)
    puts "%PATIENT-I-AFTER_ADD, phone_number association callback called."
  end

  def before_remove_method(phone_number)
    puts "%PATIENT-I-BEFORE_REMOVE, phone_number association callback called."
  end

  def after_remove_method(phone_number)
    puts "%PATIENT-I-AFTER_REMOVE, phone_number association callback called."
  end

end
