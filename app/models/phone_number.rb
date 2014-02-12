# == Schema Information
# Schema version: 20140206204214
#
# Table name: phone_numbers
#
# create_table "phone_numbers", :force => true do |t|
#   t.string   "areacode",        :limit => 3,  :null => false
#   t.string   "prefix",          :limit => 3,  :null => false
#   t.string   "number",          :limit => 4,  :null => false
#   t.string   "extension",       :limit => 5
#   t.string   "phtype",          :limit => 25, :null => false
#   t.integer  "patient_id"
#   t.integer  "emer_contact_id"
#   t.integer  "pharmacy_id"
#   t.integer  "ins_company_id"
#   t.datetime "created_at",                    :null => false
#   t.datetime "updated_at",                    :null => false
# end


class PhoneNumber < ActiveRecord::Base
  attr_accessible :areacode, :emer_contact_id, :extension, :ins_company_id, :number, :patient_id, :pharmacy_id, :prefix, :phtype

  # http://guides.rubyonrails.org/v3.2.14/association_basics.html
  belongs_to :patient, :touch => true

  validates :areacode, presence: true
  validates :prefix,   presence: true
  validates :number,   presence: true
  validates :phtype,   presence: true

  validates :areacode, uniqueness: { scope: :patient_id }
  validates :prefix,   uniqueness: { scope: :patient_id }
  validates :number,   uniqueness: { scope: :patient_id }

  def full
    return "(#{self.areacode}) #{self.prefix}-#{self.number}"
  end

end
