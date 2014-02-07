class Patient < ActiveRecord::Base
  attr_accessible :dob, :ethnicity, :fname, :gender, :lname, :race, :ssn

  validates :fname, presence: true
  validates :lname, presence: true
  validates :dob, presence: true
  validates :gender, presence: true

  def name
    [fname, lname].join(' ')
  end

  def self.by_letter(letter)
    where("lname LIKE ?", "#{letter}%").order(:lname)
  end

end
