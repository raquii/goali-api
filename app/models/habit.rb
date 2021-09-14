class Habit < ApplicationRecord
  belongs_to :user
  has_many :logs, dependent: :destroy

  validates :name, presence: true, length: {maximum: 60}
  validates :periodicity, presence: true, inclusion: {in: %w(day week month)}
  validates :goal, presence: true, numericality: { only_integer: true, less_than: 10 }
  validates :private, inclusion: [true, false]
  validates :archived, inclusion: [true, false]
  
  scope :public_active, -> { where(private:false, archived:false) }

  def total_times
    self.logs.count
  end

  def get_logs
    self.logs.map do |log|
      {date: log.date}
    end
  end

end
