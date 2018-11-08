class Paper < ApplicationRecord
  validates :title, presence: true
  validates :venue, presence: true
  validates :year, presence: true
  validates :year, numericality: { only_integer: true }

  scope :published_in_year, ->(year) { where(year: year) }

  has_and_belongs_to_many :authors

end
