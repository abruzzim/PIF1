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
