class Trip < ApplicationRecord
  validates_format_of :city, :state, with: /[A-Za-z]/, message: "Name should
   contain only letters"
  validates_length_of :zip, maximum: 5
  validate :date_cannot_be_in_the_past
  def date_cannot_be_in_the_past
    errors.add(:from_date, :to_date, "can't be in the past") if
    !from_date.blank? && from_date < Date.today
  end
  belongs_to :user
  has_many :tripfamilies, dependent: :destroy
  has_many :items, dependent: :destroy
end
