class Log < ApplicationRecord
  belongs_to :habit

  validates :date, presence: true
  validates_date :date
end
