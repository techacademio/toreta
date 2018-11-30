class Store < ApplicationRecord
  before_destroy :delete_recruits
  belongs_to :company
  has_many :store_recruits, dependent: :destroy
  has_many :recruits, through: :store_recruits

  validates :store, presence: true, length: { maximum: 255 }
  validates :address, presence: true, length: { maximum: 255 }
  validates :tel_num, presence: true, format: { with: /\A\d{10}$|^\d{11}\z/ }

  private

  def delete_recruits
    self.recruits.each do |recruit|
      recruit.destroy if recruit.stores.length == 1
    end
  end
end