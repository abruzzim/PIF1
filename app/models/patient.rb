# == Schema Information
# Schema version: 20140206204214
#
# Table name: patients
#
#   t.string   "fname",      :limit => 25, :null => false
#   t.string   "lname",      :limit => 25, :null => false
#   t.date     "dob",                      :null => false
#   t.string   "gender",     :limit => 1,  :null => false
#   t.string   "ssn",        :limit => 9
#   t.string   "race",       :limit => 25
#   t.string   "ethnicity",  :limit => 25
#   t.datetime "created_at",               :null => false
#   t.datetime "updated_at",               :null => false


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

  # Ensure phone_numbers validation.
  validates_associated :phone_numbers

  # Enable nested attributes. This adds the #phone_numbers_attributes= method.
  accepts_nested_attributes_for :phone_numbers

  # Ensure required fields are present.
  validates :fname,  presence: true
  validates :lname,  presence: true
  validates :dob,    presence: true
  validates :gender, presence: true

  # Ensure uniqueness of Last Name and DOB pairs.
  validates_uniqueness_of :lname, scope: :dob

  # Ensures first name contains only letters.
  validates :fname, format: { with: /\A[a-zA-Z]+\z/, message: "First name must only contain letters." }
  validates :lname, format: { with: /\A[a-zA-Z]+\z/, message: "Last name must only contain letters." }

  # Ensure gender is included in enumerable object.
  validates :gender, inclusion: { in: %w(M F), message: "%{value} is not a valid gender." }

  def name
    [fname, lname].join(' ')
  end

  def by_lname
    [lname, fname].join(', ')
  end

  def by_lname_dob
    [lname, fname, dob.iso8601].join(', ')
  end

  def self.by_letter(letter)
    where("lname LIKE ?", "#{letter}%").order(:lname)
  end

  def before_add_method(phone_number)
    puts "%PATIENT-I-BEFORE_ADD, phone_number association callback called."
    # Remove any phone_number instances that do not have required fields
    # before returning to the controller.
    if (phone_number.areacode == "") ||
       (phone_number.prefix == "") ||
       (phone_number.number == "") ||
       (phone_number.phtype == "")
      phone_number.destroy
      puts "%PATIENT-I-BEFORE_ADD, phone_number instance destroyed."
    end
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
