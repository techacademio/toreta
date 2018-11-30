class Recruit < ApplicationRecord
  belongs_to :company
  has_many :store_recruits, dependent: :destroy
  has_many :stores, through: :store_recruits
  
  validates :company, presence: true
  validates :startdate, presence: true
  validates :enddate, presence: true
  validates :agent, presence: true
  validates :cost, presence: true
  validates :employ_num, presence: true
  validate :start_end_check

  def start_end_check
    errors.add(:startdate, "日付を正しく入力して下さい") unless
    self.enddate >= self.startdate
  end 
end
